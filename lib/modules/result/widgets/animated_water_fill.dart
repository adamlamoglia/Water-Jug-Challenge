import 'package:flutter/material.dart';
import 'package:water_jug_challenge/imports.dart';
import 'package:water_jug_challenge/modules/result/models/step_model.dart';
import 'package:water_jug_challenge/modules/result/widgets/liquid_custom_progress_indicator.dart';
import 'package:water_jug_challenge/services/cups_paths.dart';

class AnimatedWaterFill extends StatefulWidget {
  final StepModel step;
  final bool isX;
  final double opacity;
  final double percentOfWater;

  const AnimatedWaterFill({
    Key? key,
    required this.step,
    required this.isX,
    required this.opacity,
    required this.percentOfWater,
  }) : super(key: key);

  @override
  _AnimatedWaterFillState createState() => _AnimatedWaterFillState();
}

class _AnimatedWaterFillState extends State<AnimatedWaterFill> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.opacity,
      duration: const Duration(milliseconds:  400),
      child: LiquidCustomProgressIndicator(
        valueColor: const AlwaysStoppedAnimation(Colors.blue),
        shapePath: cupPath(),
        startColorIndex: 0,
        endColorIndex: 1,
        percent: widget.percentOfWater,
        waveForce: 0,
        // waveForce: i != firstColorIndex ? 0 : 0,
        rotate: 0,
      ),
    );
  }
}
