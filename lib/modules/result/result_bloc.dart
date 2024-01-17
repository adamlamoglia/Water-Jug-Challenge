import 'package:get/get.dart';

ResultBloc get resultBloc => Get.find();

class ResultBloc extends DisposableInterface {
  Rx<int> jugX = 0.obs;
  Rx<int> jugY = 0.obs;
  Rx<int> jugZ = 0.obs;

  @override
  void onClose() {
    super.onClose();
    jugX.close();
    jugY.close();
    jugZ.close();
  }
}