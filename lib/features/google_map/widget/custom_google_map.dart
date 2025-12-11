
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_app/core/constants/constants.dart';
import 'package:taxi_app/core/models/location_info/lat_lng.dart';
import 'package:taxi_app/core/models/location_info/location.dart';
import 'package:taxi_app/core/models/location_info/location_info.dart';
import 'package:taxi_app/core/models/place_auto_complete_model/prediction.dart';
import 'package:taxi_app/core/models/routes_model/routes_model.dart';
import 'package:taxi_app/core/services/google_map_place_service.dart';
import 'package:taxi_app/core/services/location_service.dart';
import 'package:taxi_app/core/services/routes_service.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/app_assets.dart';
import 'custom_search_field.dart';
import 'place_prediction_list.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  late TextEditingController textEditingController;
  late final Future<String> taxiMapStyle;
  late AssetMapBitmap markerIcon;
  late LocationService _locationService;
  late GoogleMapPlaceService googleMapPlaceService;
  late RoutesService routesService;
  bool isFirstCall = true;
  List<Prediction> places = [];
  late Uuid uuid;
  String? sessionToken;
  late LatLng currentLocation;
  late LatLng destination;
  Set<Polyline> polylines = {};
  @override
  void initState() {
    initMapStyle();
    textEditingController = TextEditingController();
    _locationService = LocationService();
    googleMapPlaceService = GoogleMapPlaceService();
    routesService = RoutesService();
    initialCameraPosition = const CameraPosition(
      target: LatLng(37.0533317630627, 41.2248063167425),
      zoom: 3,
    );
    fetchPredictions();
    initMarkers();
    uuid = const Uuid();
    super.initState();
  }

  void fetchPredictions() {
    textEditingController.addListener(() async {
      sessionToken ??= uuid.v4();
      if (textEditingController.text.isNotEmpty) {
        var result = await googleMapPlaceService.getPredictions(
          input: textEditingController.text,
          sessiontoken: sessionToken!,
        );
        places.clear();
        places.addAll(result);
        setState(() {});
      } else {
        places.clear();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  Set<Marker> myMarkers = {};
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: taxiMapStyle,
      builder: (context, snapshot) {
        return Stack(
          children: [
            GoogleMap(
              markers: myMarkers,
              polylines: polylines,
              zoomControlsEnabled: false,
              style: snapshot.data,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (controller) {
                googleMapController = controller;
                setMyLocation();
              },
            ),
            Positioned(
              top: 20,
              right: 20,
              left: 20,
              child: Column(
                children: [
                  CustomSearchField(
                    textEditingController: textEditingController,
                  ),

                  const SizedBox(height: 16),

                  PlacesPredictionList(
                    places: places,
                    googleMapPlaceService: googleMapPlaceService,
                    onPlaceSelected: (placeDetailsModel) async {
                      destination = LatLng(
                        placeDetailsModel.geometry!.location!.lat!,
                        placeDetailsModel.geometry!.location!.lng!,
                      );
                      var polylinePoints = await getRouteData();
                      displayPolyline(polylinePoints);
                      textEditingController.clear();
                      places.clear();
                      sessionToken = null;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void initMapStyle() {
    taxiMapStyle = rootBundle.loadString(kTaxiMapStyle);
  }

  void initMarkers() async {
    markerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(),
      Assets.imagesMarker,
    );
  }

  void getLocationData() {
    _locationService.getRealTimeLocation((locationData) {
      updateMyLocationMarker(locationData);
      updateMyCamera(locationData);
    });
  }

  void updateMyCamera(LocationData locationData) {
    if (isFirstCall) {
      var cameraPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15,
      );
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
      isFirstCall = false;
    } else {
      googleMapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(locationData.latitude!, locationData.longitude!),
        ),
      );
    }
  }

  void updateMyLocationMarker(LocationData locationData) {
    myMarkers.add(
      Marker(
        position: LatLng(locationData.latitude!, locationData.longitude!),
        markerId: const MarkerId("My_Location_Marker"),
        icon: markerIcon,
      ),
    );
    setState(() {});
  }

  void setMyLocation() async {
    try {
      var locationData = await _locationService.getLocation();
      updateMyLocationMarker(locationData);
      updateMyCamera(locationData);
      currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    } on LocationServiceException catch (e) {
      e.message;
    } on LocationPermissionException catch (e) {
      e.message;
    }
  }

  Future<List<LatLng>> getRouteData() async {
    LocationInfoModel origin = LocationInfoModel(
      location: LocationModel(
        latLng: LatLngModel(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
        ),
      ),
    );
    LocationInfoModel destinationInfo = LocationInfoModel(
      location: LocationModel(
        latLng: LatLngModel(
          latitude: destination.latitude,
          longitude: destination.longitude,
        ),
      ),
    );
    RoutesModel routesData = await routesService.fetchRoutes(
      originLocation: origin,
      destination: destinationInfo,
    );
    List<PointLatLng> result = getDecodedPolyline(routesData);
    List<LatLng> points = result
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
    return points;
  }

  List<PointLatLng> getDecodedPolyline(RoutesModel routesData) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(
      routesData.routes!.first.polyline!.encodedPolyline!,
    );
    return result;
  }

  void displayPolyline(List<LatLng> polylinePoints) {
    Polyline polylineRoute = Polyline(
      polylineId: const PolylineId("main_route"),
      points: polylinePoints,
      color: AppColors.primaryColor,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );
    polylines.add(polylineRoute);
    LatLngBounds bounds = getPolylineBounds(polylinePoints);
    googleMapController?.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 16),
    );
  }

  LatLngBounds getPolylineBounds(List<LatLng> polylinePoints) {
    double southwestLatitude = polylinePoints.first.latitude;
    double southwestLongitude = polylinePoints.first.longitude;
    double northeastLatitude = polylinePoints.first.latitude;
    double northeastLongitude = polylinePoints.first.longitude;
    for (var point in polylinePoints) {
      southwestLatitude = min(southwestLatitude, point.latitude);
      southwestLongitude = min(southwestLongitude, point.longitude);
      northeastLatitude = max(northeastLatitude, point.latitude);
      northeastLongitude = max(northeastLongitude, point.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(southwestLatitude, southwestLongitude),
      northeast: LatLng(northeastLatitude, northeastLongitude),
    );
  }
}

// World View : 0 -> 3
// Country View : 4 -> 6
// City View : 10 -> 12
// Street View : 13 -> 17
// Building View : 18 -> 20
