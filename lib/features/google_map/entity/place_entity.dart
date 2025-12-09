import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceEntity {
  final String id, name;
  final LatLng latLng;

  PlaceEntity({required this.id, required this.name, required this.latLng});
}

List<PlaceEntity> places = [
  PlaceEntity(
    id: '1',
    name: 'flowers street',
    latLng: const LatLng(37.034915503189886, 41.227519508811504),
  ),
  PlaceEntity(
    id: '2',
    name: 'train station',
    latLng: const LatLng(37.05485068908832, 41.25596156801463),
  ),
  PlaceEntity(
    id: '3',
    name: 'havana hotel',
    latLng: const LatLng(37.039023013871024, 41.207039796665946),
  ),
];
