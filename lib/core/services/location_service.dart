import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  Future<void> checkLocationService() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException('');
      }
    }
  }

  Future<void> checkLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw LocationServiceException('');
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationServiceException('');
      }
    }
  }

  void getRealTimeLocation(void Function(LocationData)? onData) async {
    await checkLocationService();
    await checkLocationPermission();
    location.changeSettings(distanceFilter: 2);
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkLocationService();
    await checkLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception {
  final String message;

  LocationServiceException(this.message);
}

class LocationPermissionException implements Exception {
  final String message;

  LocationPermissionException(this.message);
}
