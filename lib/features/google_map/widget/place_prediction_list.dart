import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/core/models/place_details_model/place_details_model.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

import '../../../core/models/place_auto_complete_model/prediction.dart';
import '../../../core/services/google_map_place_service.dart';
import '../../../core/utils/app_assets.dart';

class PlacesPredictionList extends StatelessWidget {
  const PlacesPredictionList({
    super.key,
    required this.places,
    required this.googleMapPlaceService,
    required this.onPlaceSelected,
  });

  final List<Prediction> places;
  final GoogleMapPlaceService googleMapPlaceService;
  final Function(PlaceDetailsModel) onPlaceSelected;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(places[index].description!, style: AppStyles.regular14),
          leading: SvgPicture.asset(Assets.imagesMapFavoriteMarker),
          trailing: IconButton(
            onPressed: () async {
              var placeDetails = await googleMapPlaceService.getPlaceDetails(
                placeId: places[index].placeId.toString(),
              );
              onPlaceSelected(placeDetails);
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: places.length,
    );
  }
}
