import 'package:flutter/material.dart';
import 'package:water_jug_challenge/imports.dart';

class AnimatedWaterDrop extends StatefulWidget {
  final double targetHeight;

  AnimatedWaterDrop({required this.targetHeight});

  @override
  _AnimatedWaterDropState createState() => _AnimatedWaterDropState();
}

class _AnimatedWaterDropState extends State<AnimatedWaterDrop> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: widget.targetHeight == 0 ? 0 : 300),
      width: 7.0,
      height: widget.targetHeight,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
