import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/widgets/animated_gallon.dart';
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color.fromARGB(255, 210, 252, 200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STEP ${widget.index + 1}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              widget.step.text!.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedGallon(
                  step: widget.step,
                  heightFill: StepWidgetModel.heightFillLeft,
                  isX: true,
                ),
                AnimatedGallon(
                  step: widget.step,
                  heightFill: StepWidgetModel.heightFillRight,
                  isX: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              onPressed: () async {
                StepWidgetModel.reset();
                setState(() {});
                await StepWidgetModel.handleUpdateHeight(widget.step);
                setState(() {});
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
          )
        ],
      ),
    );
  }
}
