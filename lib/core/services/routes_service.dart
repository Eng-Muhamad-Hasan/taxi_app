import 'dart:convert';

import 'package:taxi_app/core/models/location_info/location_info.dart';
import 'package:taxi_app/core/models/route_modifiers.dart';
import 'package:taxi_app/core/models/routes_model/routes_model.dart';
import 'package:http/http.dart' as http;

class RoutesService {
  final String apiKey = '';
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  Future<RoutesModel> fetchRoutes({
    required LocationInfoModel originLocation,
    required LocationInfoModel destination,
    RouteModifiers? routeModifiers,
  }) async {
    Uri url = Uri.parse(baseUrl);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
    };
    Map<String, dynamic> body = {
      "origin": originLocation.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routeModifiers != null
          ? routeModifiers.toJson()
          : RouteModifiers().toJson(),
      "languageCode": "en-US",
      "units": "METRIC",
    };
    var response = await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return RoutesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('No Routes Found');
    }
  }
}
