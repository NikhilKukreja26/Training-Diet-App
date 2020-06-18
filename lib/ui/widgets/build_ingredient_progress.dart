import 'package:flutter/material.dart';

class BuildIngredientProgress extends StatelessWidget {
  final String ingredientName;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const BuildIngredientProgress(
      {Key key,
      this.ingredientName,
      this.leftAmount,
      this.progress,
      this.width,
      this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredientName.toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                Container(
                  height: 10.0,
                  width: width * progress,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text('$leftAmount g left')
          ],
        ),
      ],
    );
  }
}
