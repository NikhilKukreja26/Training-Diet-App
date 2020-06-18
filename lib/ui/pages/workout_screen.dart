import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_diet_app/ui/widgets/build_workout_image_item.dart';

import '../../models/upper_body_workout.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text(
                  '${DateFormat.EEEE().format(today)}, ${DateFormat('d MMMM').format(today)}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'UpperBody',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.white30,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "60 mins",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.shutter_speed,
                          color: Colors.white30,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "Easy",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              for (int i = 0; i < upperBody.length; i++)
                Column(
                  children: <Widget>[
                    for (int j = 0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: BuildWorkoutImageItem(
                          image: upperBody[i][j].imagePath,
                          radius: 20.0,
                          height: 45.0,
                          width: 45.0,
                          padding: 6.0,
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
