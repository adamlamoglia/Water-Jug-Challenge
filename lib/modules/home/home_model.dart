import 'package:water_jug_challenge/app/app_routes.dart';
import 'package:water_jug_challenge/imports.dart';

class HomeModel {
  static void onTapMeasureWater() {
    Get.offAllNamed(AppRoutes.result);
  }
}
