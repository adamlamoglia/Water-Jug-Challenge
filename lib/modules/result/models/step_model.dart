class StepModel {
  final StepAction? action;
  final int? actualX;
  final int? actualY;

  StepModel({
    this.action,
    this.actualX,
    this.actualY,
  });

  StepModel copyWith({
    StepAction? action,
  }) {
    return StepModel(
      action: action ?? this.action,
    );
  }
}

enum StepAction { fill, empty, transfer }
