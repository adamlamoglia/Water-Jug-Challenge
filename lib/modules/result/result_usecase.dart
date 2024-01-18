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
    // Initialize current amount of water
    // in source and destination gallons
    int from = fromGallon;
    int to = 0;

    // Initialize count of steps required
    int step = 1; // Needed to fill "from" gallon
    addToStepModel(from, to, StepActionBasic.fill, isXtoY);

    // Break the loop when either of the two
    // gallons has z litre water
    while (from != z && to != z) {
      // Find the maximum amount that can be
      // poured
      int temp = min(from, toGallon - to);

      // Pour "temp" liters from "from" to "to"
      to += temp;
      from -= temp;

      // Increment count of steps
      step++;
      addToStepModel(from, to, StepActionBasic.transfer, isXtoY);

      if (from == z || to == z) break;

      // If first jug becomes empty, fill it
      if (from == 0) {
        from = fromGallon;
        step++;
        addToStepModel(from, to, StepActionBasic.fill, isXtoY);
      }

      // If second jug becomes full, empty it
      if (to == toGallon) {
        to = 0;
        step++;
        addToStepModel(from, to, StepActionBasic.empty, isXtoY);
      }
    }
    return step;
  }

// Returns count of minimum steps needed to
// measure d liter
  void minSteps(int x, int y, int z) {
    // To make sure that m is smaller than n
    // if (x > y) {
    //   int tempM = x;
    //   x = y;
    //   y = tempM;
    // }

    // If gcd of n and m does not divide d
    // then solution is not possible
    // if ((d % _gcd(n,m)) != 0)
    //     return -1;

    // Return minimum two cases:
    // a) Water of n liter jug is poured into
    //    m liter jug
    // b) Water of m liter jug is poured into
    //    n liter jug
    min(
        pour(y, x, z, false), // y to x
        pour(x, y, z, true)); // x to y
  }
}
