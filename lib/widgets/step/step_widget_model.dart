import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';
import 'package:water_jug_challenge/widgets/step/step_widget_bloc.dart';

class StepWidgetModel {
  static const double maxHeightWaterDropFirstFaucet = 190.0;
  static const double maxHeightWaterDropSecondFaucet = 100.0;
  static const double maxPercentOfWater = 5;

  static void initStep(StepModel step) {
    switch (step.action) {
      case StepAction.fillX:
        updateOpacityWaterGallonLeft(1);
        updatePercentOfWaterInGallonLeft(maxPercentOfWater);
        updatePercentOfWaterInGallonRight(
            _getPercentOfWaterInGallon(step.actualY!, resultBloc.jugY.value));
        break;
      case StepAction.fillY:
        updateOpacityWaterGallonRight(1);
        updatePercentOfWaterInGallonRight(maxPercentOfWater);
        updatePercentOfWaterInGallonLeft(
            _getPercentOfWaterInGallon(step.actualX!, resultBloc.jugX.value));
        break;
      case StepAction.emptyX:
        updateHeightEmptyGallonLeft(0);
        updatePercentOfWaterInGallonLeft(0);
        updatePercentOfWaterInGallonRight(
            _getPercentOfWaterInGallon(step.actualY!, resultBloc.jugY.value));
        break;
      case StepAction.emptyY:
        updateHeightEmptyGallonRight(0);
        updatePercentOfWaterInGallonRight(0);
        updatePercentOfWaterInGallonLeft(
            _getPercentOfWaterInGallon(step.actualX!, resultBloc.jugX.value));
        break;
      case StepAction.transferXtoY:
        updateOpacityWaterGallonLeft(1);
        updateOpacityWaterGallonRight(1);
        _updatePercentages(step);
        break;
      case StepAction.transferYtoX:
        updateOpacityWaterGallonLeft(1);
        updateOpacityWaterGallonRight(1);
        _updatePercentages(step);
        break;
      default:
        break;
    }
  }

  static void _updatePercentages(StepModel step) {
    updatePercentOfWaterInGallonLeft(
        _getPercentOfWaterInGallon(step.actualX!, resultBloc.jugX.value));
    updatePercentOfWaterInGallonRight(
        _getPercentOfWaterInGallon(step.actualY!, resultBloc.jugY.value));
  }

  static Future<void> animateStep(StepModel step) async {
    switch (step.action) {
      case StepAction.fillX:
        updateHeightFillFaucetLeft(maxHeightWaterDropFirstFaucet);
        updateOpacityWaterGallonLeft(1);
        updatePercentOfWaterInGallonLeft(maxPercentOfWater);
        break;
      case StepAction.fillY:
        updateHeightFillFaucetRight(maxHeightWaterDropFirstFaucet);
        updateOpacityWaterGallonRight(1);
        updatePercentOfWaterInGallonRight(maxPercentOfWater);
        break;
      case StepAction.emptyX:
        updateHeightEmptyGallonLeft(maxHeightWaterDropSecondFaucet);
        await Future.delayed(const Duration(milliseconds: 500));
        updateOpacityWaterGallonLeft(0);
        updatePercentOfWaterInGallonLeft(0);
        break;
      case StepAction.emptyY:
        updateHeightEmptyGallonRight(maxHeightWaterDropSecondFaucet);
        await Future.delayed(const Duration(milliseconds: 500));
        updateOpacityWaterGallonRight(0);
        updatePercentOfWaterInGallonRight(0);
        break;
      case StepAction.transferXtoY:
        updatePercentOfWaterInGallonLeft(_getPercentOfWaterInGallon(
            (step.actualX! + step.actualY!), resultBloc.jugX.value));
        updatePercentOfWaterInGallonRight(0);
        await Future.delayed(const Duration(milliseconds: 500));
        updateOpacityWaterGallonRight(1);
        _updatePercentages(step);

        break;
      case StepAction.transferYtoX:
        updatePercentOfWaterInGallonRight(_getPercentOfWaterInGallon(
            (step.actualX! + step.actualY!), resultBloc.jugY.value));
        updatePercentOfWaterInGallonLeft(0);
        await Future.delayed(const Duration(milliseconds: 500));
        updateOpacityWaterGallonLeft(1);
        _updatePercentages(step);
        break;
      default:
        break;
    }
    return Future.value();
  }

  static double _getPercentOfWaterInGallon(int actual, int maxCapacity) {
    return ((maxPercentOfWater / 100) * (actual / maxCapacity)) * 100;
  }

  static void updateOpacityWaterGallonLeft(double height) {
    stepWidgetBloc.opacityWaterGallonLeft.value = height;
  }

  static void updateOpacityWaterGallonRight(double height) {
    stepWidgetBloc.opacityWaterGallonRight.value = height;
  }

  static void updateHeightEmptyGallonLeft(double height) {
    stepWidgetBloc.heightEmptyLeft.value = height;
  }

  static void updateHeightEmptyGallonRight(double height) {
    stepWidgetBloc.heightEmptyRight.value = height;
  }

  static void updateHeightFillFaucetLeft(double height) {
    stepWidgetBloc.heightFillFaucetLeft.value = height;
  }

  static void updateHeightFillFaucetRight(double height) {
    stepWidgetBloc.heightFillFaucetRight.value = height;
  }

  static void updatePercentOfWaterInGallonLeft(double percent) {
    print("percentX: $percent jugX: ${resultBloc.jugX.value}");
    stepWidgetBloc.percentOfWaterInGallonLeft.value = percent;
  }

  static void updatePercentOfWaterInGallonRight(double percent) {
    print("percentY: $percent");
    stepWidgetBloc.percentOfWaterInGallonRight.value = percent;
  }

  static void emptyFaucetWater() {
    stepWidgetBloc.heightFillFaucetLeft.value = 0.0;
    stepWidgetBloc.heightFillFaucetRight.value = 0.0;
    stepWidgetBloc.heightEmptyLeft.value = 0.0;
    stepWidgetBloc.heightEmptyRight.value = 0.0;
  }

  static void resetHeights(StepModel step) {
    switch (step.action) {
      case StepAction.fillX:
        stepWidgetBloc.heightFillFaucetLeft.value = 0.0;
        stepWidgetBloc.percentOfWaterInGallonLeft.value = 0.0;
        break;
      case StepAction.fillY:
        stepWidgetBloc.heightFillFaucetRight.value = 0.0;
        stepWidgetBloc.percentOfWaterInGallonRight.value = 0.0;
        break;
      case StepAction.emptyX:
        stepWidgetBloc.heightEmptyLeft.value = 0;
        stepWidgetBloc.percentOfWaterInGallonLeft.value = maxPercentOfWater;
        break;
      case StepAction.emptyY:
        stepWidgetBloc.heightEmptyRight.value = 0;
        stepWidgetBloc.percentOfWaterInGallonRight.value = maxPercentOfWater;
        break;
      case StepAction.transferXtoY:
        break;
      case StepAction.transferYtoX:
        break;
      default:
        break;
    }
  }

  static void resetOpacity(StepModel step) {
    switch (step.action) {
      case StepAction.fillX:
        stepWidgetBloc.opacityWaterGallonLeft.value = 0.0;
        break;
      case StepAction.fillY:
        stepWidgetBloc.opacityWaterGallonRight.value = 0.0;
        break;
      case StepAction.emptyX:
        stepWidgetBloc.opacityWaterGallonLeft.value = 1.0;
        break;
      case StepAction.emptyY:
        stepWidgetBloc.opacityWaterGallonRight.value = 1.0;
        break;
      case StepAction.transferXtoY:
        stepWidgetBloc.opacityWaterGallonLeft.value = 1.0;
        stepWidgetBloc.opacityWaterGallonRight.value = 0.0;
        break;
      case StepAction.transferYtoX:
        stepWidgetBloc.opacityWaterGallonLeft.value = 0.0;
        stepWidgetBloc.opacityWaterGallonRight.value = 1.0;
        break;
      default:
        break;
    }
  }
}
