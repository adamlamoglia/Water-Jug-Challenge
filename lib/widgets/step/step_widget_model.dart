import 'package:water_jug_challenge/modules/result/models/step_model.dart';

class StepWidgetModel {
  static double heightFillLeft = 0.0;
  static double heightFillRight = 0.0;
  static double heightEmptyLeft = 0.0;
  static double heightEmptyRight = 0.0;

  static Future<void> handleUpdateHeight(StepModel step) async {
    await Future.delayed(const Duration(milliseconds: 500));
    switch (step.action) {
      case StepAction.fillX:
        updateHeightFillLeft(200);
        break;
      case StepAction.fillY:
        updateHeightFillRight(200);
        break;
      case StepAction.emptyX:
        updateHeightEmptyLeft(200);
        break;
      case StepAction.emptyY:
        updateHeightEmptyRight(200);
        break;
      case StepAction.transferXtoY:
        break;
      case StepAction.transferYtoX:
        break;
      default:
        break;
    }
    return Future.value();
  }

  static void updateHeightFillLeft(double height) {
    heightFillLeft = height;
  }

  static void updateHeightFillRight(double height) {
    heightFillRight = height;
  }

  static void updateHeightEmptyLeft(double height) {
    heightEmptyLeft = height;
  }

  static void updateHeightEmptyRight(double height) {
    heightEmptyRight = height;
  }

  static void reset() {
    heightFillLeft = 0.0;
    heightFillRight = 0.0;
    heightEmptyLeft = 0.0;
    heightEmptyRight = 0.0;
  }
}
