import 'package:flutter/material.dart';

import 'wave.dart';

class LiquidCustomProgressIndicator extends ProgressIndicator {
  const LiquidCustomProgressIndicator({
    required this.shapePath,
    required this.startColorIndex,
    required this.endColorIndex,
    required this.waveForce,
    this.rotate = 0.0,
    this.reverse = false,
    this.stopped = false,
    Key? key,
    double percent = 0.0,
    Color? backgroundColor = Colors.transparent,
    Animation<Color>? valueColor,
  }) : super(
          key: key,
          value: percent,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
        );

  ///The path used to draw the shape of the progress indicator. The size of the progress indicator is controlled by the bounds of this path.
  final Path shapePath;

  final int startColorIndex;

  final bool stopped;

  final bool reverse;

  final int endColorIndex;

  final double rotate;

  final double waveForce;

  Color _getBackgroundColor(BuildContext context) =>
      backgroundColor ?? Theme.of(context).colorScheme.background;

  Color _getValueColor(BuildContext context) =>
      valueColor?.value ?? Theme.of(context).colorScheme.secondary;

  @override
  State<StatefulWidget> createState() => _LiquidCustomProgressIndicatorState();
}

class _LiquidCustomProgressIndicatorState
    extends State<LiquidCustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final pathBounds = widget.shapePath.getBounds();
    return SizedBox(
      width: pathBounds.width + pathBounds.left,
      height: pathBounds.height + pathBounds.top,
      child: ClipPath(
        clipper: _CustomPathClipper(
          path: widget.shapePath,
        ),
        child: CustomPaint(
          painter: _CustomPathPainter(
            color: widget._getBackgroundColor(context),
            path: widget.shapePath,
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                left: pathBounds.left,
                top: pathBounds.top,
                child: Wave(
                  value: widget.value ?? 0.0,
                  color: widget._getValueColor(context),
                  startColorIndex: widget.startColorIndex,
                  endColorIndex: widget.endColorIndex,
                  stopped: widget.stopped,
                  reverse: widget.reverse,
                  rotate: widget.rotate,
                  waveForce: widget.waveForce,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomPathPainter extends CustomPainter {
  _CustomPathPainter({required this.color, required this.path});
  final Color color;
  final Path path;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CustomPathPainter oldDelegate) =>
      color != oldDelegate.color || path != oldDelegate.path;
}

class _CustomPathClipper extends CustomClipper<Path> {
  _CustomPathClipper({required this.path});
  final Path path;

  @override
  Path getClip(Size size) {
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
