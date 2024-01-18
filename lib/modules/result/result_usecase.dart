import 'dart:math';
import 'package:water_jug_challenge/app/app_routes.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/result_model.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/result_bloc.dart';

ResultUseCase get resultUseCase => Get.find();

class ResultUseCase extends DisposableInterface {
  void measureWater() {
    int jugX = resultBloc.jugX.value;
    int jugY = resultBloc.jugY.value;
    int targetAmount = resultBloc.jugZ.value;

    if (_canMeasureWater(jugX, jugY, targetAmount)) {
      resultBloc.noSolution.value = '';
      minSteps(jugX, jugY, targetAmount);
      Get.offAllNamed(AppRoutes.result);
    } else {
      resultBloc.noSolution.value = 'No solution';
    }
  }

  bool _canMeasureWater(int x, int y, int z) {
    if (x + y <= z) {
      return false;
    }
    if (x == z || y == z || x + y == z) {
      return true;
    }
    return z % _gcd(x, y) == 0;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  void addToStepModel(int from, int to, StepActionBasic action, bool isXtoY) {
    StepAction? stepAction;

    switch (action) {
      case StepActionBasic.fill:
        stepAction = isXtoY ? StepAction.fillX : StepAction.fillY;
        break;
      case StepActionBasic.empty:
        stepAction = isXtoY ? StepAction.emptyY : StepAction.emptyX;
        break;
      case StepActionBasic.transfer:
        stepAction = isXtoY ? StepAction.transferXtoY : StepAction.transferYtoX;
        break;
    }

    if (isXtoY) {
      ResultModel.addStepStartingFromX(StepModel(
        action: stepAction,
        actualX: from,
        actualY: to,
      ));
    } else {
      ResultModel.addStepStartingFromY(StepModel(
        action: stepAction,
        actualX: to,
        actualY: from,
      ));
    }
  }

  int pour(int fromGallon, int toGallon, int z, bool isXtoY) {
    int from = fromGallon;
    int to = 0;

    int step = 1;
    addToStepModel(from, to, StepActionBasic.fill, isXtoY);

    while (from != z && to != z) {
      int temp = min(from, toGallon - to);

      to += temp;
      from -= temp;

      step++;
      addToStepModel(from, to, StepActionBasic.transfer, isXtoY);

      if (from == z || to == z) break;

      if (from == 0) {
        from = fromGallon;
        step++;
        addToStepModel(from, to, StepActionBasic.fill, isXtoY);
      }

      if (to == toGallon) {
        to = 0;
        step++;
        addToStepModel(from, to, StepActionBasic.empty, isXtoY);
      }
    }
    return step;
  }

  void minSteps(int x, int y, int z) {
    min(
        pour(y, x, z, false), // y to x
        pour(x, y, z, true)); // x to y
  }
}
