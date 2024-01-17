import 'package:get/get.dart';

HomeBloc get homeBloc => Get.find();

class HomeBloc extends DisposableInterface {
  Rx<bool> btnActive = false.obs;

  @override
  void onClose() {
    super.onClose();
    btnActive.close();
  }
}