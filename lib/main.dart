import 'package:flutter/material.dart';
import 'package:hive_learning/ui/home_screen.dart';

void main(){
runApp(HiveLearningApp());
}
class HiveLearningApp extends StatelessWidget {
  const HiveLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
