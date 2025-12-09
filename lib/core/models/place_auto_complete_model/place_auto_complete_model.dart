import 'prediction.dart';

class PlaceAutoCompleteModel {
  List<Prediction>? predictions;
  String? status;

  PlaceAutoCompleteModel({this.predictions, this.status});

  factory PlaceAutoCompleteModel.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteModel(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'predictions': predictions?.map((e) => e.toJson()).toList(),
    'status': status,
  };
}
