import 'package:water_jug_challenge/modules/result/models/step_model.dart';

class ResultModel {
  static List<StepModel>? stepsStartingFromX = [];
  static List<StepModel>? stepsStartingFromY = [];

  static void addStepStartingFromX(StepModel step) {
    stepsStartingFromX!.add(step);
  }

  static void addStepStartingFromY(StepModel step) {
    stepsStartingFromY!.add(step);
  }
}
