import 'package:flutter/material.dart';
import 'package:grade_average_app/model/grade_model.dart';

class DataHelper {
  static List<Grade> allAddedGrades = [];

  static void addGrade(Grade grade) {
    allAddedGrades.add(grade);
  }

  static double calculateAverage() {
    double totalNote = 0;
    double totalCredit = 0;

    for (var element in allAddedGrades) {
      totalNote += element.credit * element.degree;
      totalCredit += element.credit;
    }

    return totalNote / totalCredit;
  }

  static List<String> _allGradeDegrees() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static double _convertDegreeToNote(String degree) {
    switch (degree) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0.0;
    }
  }

  static List<DropdownMenuItem<double>> allGradeDegreeItems() {
    return _allGradeDegrees().map((e) => DropdownMenuItem(value: _convertDegreeToNote(e), child: Text(e))).toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditItems() {
    return _allCredits().map((e) => DropdownMenuItem(value: e.toDouble(), child: Text(e.toString()))).toList();
  }
}
