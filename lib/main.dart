import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_learning/ui/home_screen.dart';

void main(){
runApp(HiveLearningApp());
}
class HiveLearningApp extends StatelessWidget {
  const HiveLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
