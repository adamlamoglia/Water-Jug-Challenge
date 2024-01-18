import 'package:water_jug_challenge/modules/result/models/result_model.dart';

class StepModel {
  final StepAction? action;
  final int? actualX;
  final int? actualY;
  String? text;

  StepModel({
    this.action,
    this.actualX,
    this.actualY,
  }) {
    switch (action) {
      case StepAction.fillX:
        text = ResultModel.fillBucketX;
        break;
      case StepAction.fillY:
        text = ResultModel.fillBucketY;
        break;
      case StepAction.emptyX:
        text = ResultModel.emptyBucketX;
        break;
      case StepAction.emptyY:
        text = ResultModel.emptyBucketY;
        break;
      case StepAction.transferXtoY:
        text = ResultModel.transferFromBucketXtoBucketY;
        break;
      case StepAction.transferYtoX:
        text = ResultModel.transferFromBucketYtoBucketX;
        break;
      default:
        text = '';
        break;
    }
  }

  StepModel copyWith({
    StepAction? action,
  }) {
    return StepModel(
      action: action ?? this.action,
    );
  }
}

enum StepAction { fillX, fillY, emptyX, emptyY, transferXtoY, transferYtoX }

enum StepActionBasic { fill, empty, transfer }
