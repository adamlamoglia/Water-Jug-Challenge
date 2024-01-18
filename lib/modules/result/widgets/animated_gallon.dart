import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/widgets/animated_water_drop.dart';

class AnimatedGallon extends StatelessWidget {
  const AnimatedGallon({
    Key? key,
    required this.step,
    required this.heightFill,
    required this.isX,
  }) : super(key: key);

  final StepModel step;
  final double heightFill;
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
                child: AnimatedWaterDrop(targetHeight: heightFill),
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
                top: 150,
                left: 20,
                child: Image.asset(
                  'assets/gallon2.png',
                  height: 130,
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
        const SizedBox(height: 10),
        Text(
          isX ? 'X: ${step.actualX} L' : 'Y: ${step.actualY} L',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
