import 'package:flutter/material.dart';
import 'package:grade_average_app/constant/project_constants.dart';
import 'package:grade_average_app/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Average App',
      theme: ThemeData(
        primarySwatch: ProjectConstants.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeView(),
    );
  }
}
