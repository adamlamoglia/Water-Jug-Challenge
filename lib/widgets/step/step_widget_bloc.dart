import 'package:get/get.dart';

StepWidgetBloc get stepWidgetBloc => Get.find();

class StepWidgetBloc extends DisposableInterface {
  Rx<double> heightFillFaucetLeft = 0.0.obs;
  Rx<double> heightFillFaucetRight = 0.0.obs;

  Rx<double> heightEmptyLeft = 0.0.obs;
  Rx<double> heightEmptyRight = 0.0.obs;

  Rx<double> percentOfWaterInGallonLeft = 0.0.obs;
  Rx<double> percentOfWaterInGallonRight = 0.0.obs;

  Rx<double> opacityWaterGallonLeft = 0.0.obs;
  Rx<double> opacityWaterGallonRight = 0.0.obs;

  @override
  void onClose() {
    super.onClose();
    heightFillFaucetLeft.close();
    heightFillFaucetRight.close();
    opacityWaterGallonLeft.close();
    opacityWaterGallonRight.close();
    heightEmptyLeft.close();
    heightEmptyRight.close();
    percentOfWaterInGallonLeft.close();
    percentOfWaterInGallonRight.close();
  }
}
