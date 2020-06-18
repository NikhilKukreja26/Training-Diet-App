import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';

import '../../models/meal.dart';
import '../widgets/build_workout_image_item.dart';
import '../widgets/build_ingredient_progress.dart';
import '../widgets/build_radial_progress.dart';
import '../../ui/pages/workout_screen.dart';
import '../widgets/build_meal_item_card.dart';

class ProfileScreen extends StatelessWidget {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          iconSize: 40.0,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: const Text(
                'Home',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: const Text(
                'Search',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: const Text(
                'Profile',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: height * 0.35,
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40.0),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 32.0,
                  right: 16.0,
                  bottom: 10.0,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${DateFormat.EEEE().format(today)}, ${DateFormat('d MMMM').format(today)}',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        'Hello, David',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(
                        child: Image.asset('assets/images/user.jpg'),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        BuildRadialProgress(
                          height: width * 0.3,
                          width: width * 0.3,
                          progress: 0.7,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BuildIngredientProgress(
                              ingredientName: 'Protien',
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.28,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            BuildIngredientProgress(
                              ingredientName: 'Carbs',
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * 0.28,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            BuildIngredientProgress(
                              ingredientName: 'Fat',
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount: 62,
                              width: width * 0.28,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.37,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      left: 32.0,
                      right: 16.0,
                    ),
                    child: const Text(
                      'MEALS FOR TODAY',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 32.0,
                            ),
                            for (int i = 0; i < meals.length; i++)
                              BuildMealItemCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedColor: const Color(0xFFE9E9E9),
                      closedElevation: 0.0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: Duration(milliseconds: 1000),
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return InkWell(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 32.0,
                              right: 32.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    left: 16.0,
                                  ),
                                  child: const Text(
                                    'YOUR NEXT WORKOUT',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 16),
                                  child: const Text(
                                    'Upper Body',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      BuildWorkoutImageItem(
                                        image: 'assets/images/chest.png',
                                        radius: 25.0,
                                        width: 50.0,
                                        height: 50.0,
                                        padding: 10.0,
                                      ),
                                      BuildWorkoutImageItem(
                                        image: 'assets/images/back.png',
                                        radius: 25.0,
                                        width: 50.0,
                                        height: 50.0,
                                        padding: 10.0,
                                      ),
                                      BuildWorkoutImageItem(
                                        image: 'assets/images/biceps.png',
                                        radius: 25.0,
                                        width: 50.0,
                                        height: 50.0,
                                        padding: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
