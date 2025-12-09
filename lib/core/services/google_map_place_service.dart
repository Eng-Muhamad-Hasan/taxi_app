import 'dart:convert';

import 'package:taxi_app/core/models/place_auto_complete_model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/core/models/place_details_model/place_details_model.dart';

class GoogleMapPlaceService {
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apikey = 'AIzaSyB7c-3-5-0-0';
  Future<List<Prediction>> getPredictions({
    required String input,
    required String sessiontoken,
  }) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/autocomplete/json?input=$input&key=$apikey&sessiontoken=$sessiontoken',
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<Prediction> predictions = [];
      for (var i in data) {
        predictions.add(Prediction.fromJson(data[i]));
      }
      return predictions;
    } else {
      throw Exception('Failed to get predictions');
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/details/json?place_id=$placeId&key=$apikey'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];

      return PlaceDetailsModel.fromJson(data);
    } else {
      throw Exception('Failed to get place details');
    }
  }
}
