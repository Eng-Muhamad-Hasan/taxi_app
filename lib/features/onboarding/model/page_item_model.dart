import 'package:taxi_app/core/utils/app_assets.dart';

class PageItemModel {
  final String title, subTitle, image;

  PageItemModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<PageItemModel> pageItems = [
  PageItemModel(
    title: 'احجز رحلتك في اي وقت ',
    subTitle: 'أصبح التنقل أسهل وأسرع',
    image: Assets.imagesImgCar1,
  ),
  PageItemModel(
    title: 'تابع رحلتك لحظة بلحظة',
    subTitle: 'نقدم لك تجربة سفر مريحة وآمنة',
    image: Assets.imagesImgCar2,
  ),
  PageItemModel(
    title: 'لا تقلق ابداً بشأن الدفع !',
    subTitle: 'نقدم لك خيارات دفع متعددة ومرنة',
    image: Assets.imagesImgCar3,
  ),
];

