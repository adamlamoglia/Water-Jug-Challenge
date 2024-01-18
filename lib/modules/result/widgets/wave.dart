import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wave extends StatefulWidget {
  const Wave({
    required this.value,
    required this.color,
    required this.endColorIndex,
    required this.stopped,
    required this.reverse,
    required this.rotate,
    required this.waveForce,
    this.startColorIndex = 0,
    Key? key,
  }) : super(key: key);

  final double value;
  final double rotate;
  final double waveForce;
  final Color color;
  final int startColorIndex;
  final int endColorIndex;
  final bool stopped;
  final bool reverse;

  @override
  WaveState createState() => WaveState();
}

class WaveState extends State<Wave> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: 1.seconds,
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) => ClipPath(
        clipper: _WaveClipper(
          animationValue: _animationController.value,
          value: widget.value,
          startColorIndex: widget.startColorIndex,
          endColorIndex: widget.endColorIndex,
          stopped: widget.stopped,
          reverse: widget.reverse,
          rotate: widget.rotate,
          waveForce: widget.waveForce,
        ),
        child: Container(
          color: widget.color,
        ),
      ),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  _WaveClipper({
    required this.animationValue,
    required this.value,
    required this.startColorIndex,
    required this.endColorIndex,
    required this.stopped,
    required this.reverse,
    required this.rotate,
    required this.waveForce,
  });
  final double animationValue;
  final double value;
  final double rotate;
  final int startColorIndex;
  final int endColorIndex;
  final bool stopped;
  final bool reverse;
  final double waveForce;

  double get colorSize => 30;
  double startHeight(Size size) => size.height - (colorSize * startColorIndex);
  double get endHeight => colorSize * (4 - endColorIndex);
  int get qtdColors => endColorIndex - startColorIndex;

  double get rP {
    if (rotate > 0) {
      return rotate / 7;
    }
    return 0;
  }

  double get rN {
    if (rotate < 0) {
      return -rotate / 7;
    }
    return 0;
  }

  @override
  Path getClip(Size size) {
    if (stopped) {
      return Path()
        ..moveTo(0, endHeight + 11 + rP - rN)
        ..lineTo(size.width, endHeight + 11 - rP + rN)
        ..lineTo(size.width, startHeight(size) + 1 + rN)
        ..lineTo(0.0, startHeight(size) + 1 + rP)
        ..close();
    }
    Path path = Path()
      ..addPolygon(_generateVerticalWavePath(size), false)
      ..lineTo(size.width, startHeight(size) + 1)
      ..lineTo(0.0, startHeight(size) + 1 + rP)
      ..close();
    return path;
  }

  List<Offset> _generateVerticalWavePath(Size size) {
    final waveList = <Offset>[];
    const force = 60;
    var waveHeight = startHeight(size) / 20;
    final waveForceAux = 1 - waveForce;
    waveHeight = waveHeight - (waveHeight * waveForceAux);
    for (int i = -2; i <= size.width.toInt(); i++) {
      final dy =
          math.sin((animationValue * 360 - i) % 360 * (math.pi / force)) *
                  waveHeight +
              (startHeight(size) -
                  (colorSize * qtdColors) +
                  (colorSize * qtdColors) * (1 - value));
      waveList.add(Offset(i.toDouble(), dy));
    }
    return waveList;
  }

  // List<Offset> _generateVerticalWavePath(Size size) {
  //   final waveList = <Offset>[];
  //   var waveHeight = startHeight(size) / 20;
  //   waveHeight = waveHeight - (waveHeight * value);
  //   var force = 60;
  //   for (int i = -2; i <= size.width.toInt() + 2; i++) {
  //     final dy =
  //         math.sin((animationValue * 360 - i) % 360 * (math.pi / force)) *
  //                 waveHeight +
  //             (startHeight(size) - ((startHeight(size) - endHeight) * value));
  //     waveList.add(Offset(i.toDouble(), dy));
  //   }
  //   return waveList;
  // }

  //   List<Offset> _generateHorizontalWavePath(Size size) {
  //   final waveList = <Offset>[];
  //   for (int i = -2; i <= size.height.toInt() + 2; i++) {
  //     final waveHeight = (size.width / 20);
  //     final dx = math.sin((animationValue * 360 - i) % 360 * (math.pi / 180)) *
  //             waveHeight +
  //         (size.width * value);
  //     waveList.add(Offset(dx, i.toDouble()));
  //   }
  //   return waveList;
  // }

  @override
  bool shouldReclip(_WaveClipper oldClipper) => true;
}
