import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/widgets/animated_water_drop.dart';
import 'package:water_jug_challenge/modules/result/widgets/animated_water_fill.dart';

class AnimatedGallon extends StatelessWidget {
  const AnimatedGallon({
    Key? key,
    required this.step,
    required this.heightFillFaucet,
    required this.opacityFillGallon,
    required this.heightEmptyGallon,
    required this.percentOfWater,
    required this.isX,
  }) : super(key: key);

  final StepModel step;
  final double heightFillFaucet;
  final double opacityFillGallon;
  final double heightEmptyGallon;
  final double percentOfWater;
  final bool isX;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 350,
          child: Stack(
            children: [
              Positioned(
                top: 90,
                left: 40,
                child: AnimatedWaterDrop(
                  targetHeight: heightFillFaucet,
                ),
              ),
              Positioned(
                top: 50,
                left: 27,
                child: Image.asset(
                  'assets/faucet.png',
                  height: 50,
                ),
              ),
              Positioned(
                top: 138,
                left: 19,
                child: AnimatedWaterFill(
                  step: step,
                  isX: isX,
                  opacity: opacityFillGallon,
                  percentOfWater: percentOfWater,
                ),
              ),
              Positioned(
                top: 143,
                left: 19,
                child: Image.asset(
                  'assets/gallon2.png',
                  height: 140,
                ),
              ),
              Positioned(
                top: 290,
                left: 40,
                child: AnimatedWaterDrop(
                  targetHeight: heightEmptyGallon,
                ),
              ),
              Positioned(
                top: 250,
                left: 28,
                child: Image.asset(
                  'assets/faucet.png',
                  height: 50,
                ),
              ),
            ],
          ),
        ),
        Text(
          isX ? 'X: ${step.actualX} L' : 'Y: ${step.actualY} L',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
