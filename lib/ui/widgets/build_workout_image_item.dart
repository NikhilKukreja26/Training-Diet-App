import 'package:flutter/material.dart';

class BuildWorkoutImageItem extends StatelessWidget {
  final String image;
  final double radius, width, height, padding;

  BuildWorkoutImageItem(
      {this.image, this.radius, this.width, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        color: const Color(0xFF5B4D9D),
      ),
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        image,
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
