import 'package:flutter/material.dart';
import 'package:taxi_app/features/google_map/view/map_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MapScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MapScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
