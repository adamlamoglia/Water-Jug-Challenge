import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/result_model.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/widgets/animated_gallon.dart';
import 'package:water_jug_challenge/widgets/step/step_widget_bloc.dart';
import 'package:water_jug_challenge/widgets/step/step_widget_model.dart';

class StepWidget extends StatefulWidget {
  final StepModel step;
  final int index;

  StepWidget({
    super.key,
    required this.step,
    required this.index,
  });

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  @override
  void initState() {
    //StepWidgetModel.reset();
    //StepWidgetModel.updateGallonHeight(widget.step);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StepWidgetModel.initStep(widget.step);
    });
    return ResponsiveWrapper(
      defaultScaleFactor: 0.95,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color.fromARGB(255, 210, 252, 200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: Text(
                'STEP ${widget.index + 1}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                height: 30,
                child: Text(
                  widget.step.text!.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            if (widget.index == ResultModel.getBestSolution().length - 1) ...[
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "SOLVED!",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
            //const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => AnimatedGallon(
                        step: widget.step,
                        heightFillFaucet:
                            stepWidgetBloc.heightFillFaucetLeft.value,
                        opacityFillGallon:
                            stepWidgetBloc.opacityWaterGallonLeft.value,
                        heightEmptyGallon: stepWidgetBloc.heightEmptyLeft.value,
                        percentOfWater:
                            stepWidgetBloc.percentOfWaterInGallonLeft.value,
                        isX: true,
                      ),
                    ),
                    Obx(
                      () => AnimatedGallon(
                        step: widget.step,
                        heightFillFaucet:
                            stepWidgetBloc.heightFillFaucetRight.value,
                        opacityFillGallon:
                            stepWidgetBloc.opacityWaterGallonRight.value,
                        heightEmptyGallon:
                            stepWidgetBloc.heightEmptyRight.value,
                        percentOfWater:
                            stepWidgetBloc.percentOfWaterInGallonRight.value,
                        isX: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  StepWidgetModel.resetOpacity(widget.step);
                  StepWidgetModel.resetHeights(widget.step);
                  await Future.delayed(const Duration(milliseconds: 500));
                  await StepWidgetModel.animateStep(widget.step);
                  await Future.delayed(const Duration(milliseconds: 700));
                  StepWidgetModel.emptyFaucetWater();
                },
                icon: const Icon(Icons.play_arrow, size: 18),
                label: Text(
                  "PLAY ANIMATION",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 142, 156, 231),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
