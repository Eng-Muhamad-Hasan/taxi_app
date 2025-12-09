import 'package:flutter/material.dart';
import 'package:taxi_app/features/google_map/widget/custom_google_map.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  static const String routeName = 'map_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: CustomGoogleMap()),
    );
  }
}
