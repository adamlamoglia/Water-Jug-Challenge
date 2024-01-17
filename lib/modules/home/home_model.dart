import 'package:water_jug_challenge/app/app_routes.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/result_usecase.dart';

class HomeModel {
  static void onTapMeasureWater() {
    resultUseCase.measureWater();
    Get.offAllNamed(AppRoutes.result);
  }
}
