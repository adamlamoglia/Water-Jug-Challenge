import 'package:water_jug_challenge/app/app_routes.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';

class ResultModel {
  static List<StepModel>? stepsStartingFromX = [];
  static List<StepModel>? stepsStartingFromY = [];

  static const String fillBucketX = 'Fill bucket X';
  static const String fillBucketY = 'Fill bucket Y';
  static const String emptyBucketX = 'Empty bucket X';
  static const String emptyBucketY = 'Empty bucket Y';
  static const String transferFromBucketXtoBucketY =
      'Transfer from bucket X to bucket Y';
  static const String transferFromBucketYtoBucketX =
      'Transfer from bucket Y to bucket X';

  static void addStepStartingFromX(StepModel step) {
    stepsStartingFromX!.add(step);
  }

  static void addStepStartingFromY(StepModel step) {
    stepsStartingFromY!.add(step);
  }

  static void clearSteps() {
    stepsStartingFromX!.clear();
    stepsStartingFromY!.clear();

    resultBloc.jugX.value = 0;
    resultBloc.jugY.value = 0;
    resultBloc.jugZ.value = 0;
  }

  static List<StepModel> getBestSolution() {
    if (stepsStartingFromX!.length < stepsStartingFromY!.length) {
      return stepsStartingFromX!;
    } else {
      return stepsStartingFromY!;
    }
  }

  static void goBackToHome() {
    clearSteps();

    Get.offAllNamed(AppRoutes.home);
  }
}
