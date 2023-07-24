import 'package:flutter/material.dart';
import 'package:grade_average_app/constant/project_constants.dart';

class ShowAverageWidget extends StatelessWidget {
  final double average;
  final int gradeCount;
  const ShowAverageWidget({super.key, required this.average, required this.gradeCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          gradeCount > 0 ? '$gradeCount Grade Here' : 'Add Grade',
          style: ProjectConstants.gradeCountBodyStyle,
        ),
        Text(
          average > 0 ? average.toStringAsFixed(2) : '0.0',
          style: ProjectConstants.averageStyle,
        ),
        Text('Average', style: ProjectConstants.gradeCountBodyStyle),
      ],
    );
  }
}
