import 'package:flutter/material.dart';

import './build_radial_painter.dart';

class BuildRadialProgress extends StatelessWidget {
  final double width, height, progress;

  const BuildRadialProgress({
    Key key,
    this.width,
    this.height,
    this.progress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadialPainter(progress: progress),
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: const TextStyle(
                    color: Color(0xFF200087),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "\n",
                ),
                TextSpan(
                  text: "kcal left",
                  style: const TextStyle(
                    color: Color(0xFF200087),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
