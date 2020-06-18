import 'package:flutter/material.dart';
import './ui/pages/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Training and Diet App',
      home: ProfileScreen(),
    );
  }
}
