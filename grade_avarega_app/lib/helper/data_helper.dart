import 'package:flutter/material.dart';
import 'package:grade_avarega_app/model/lesson.dart';

class DataHelper {

  static List<Lesson> allAddedLessons=[];

  static addLesson(Lesson lesson){
    allAddedLessons.add(lesson);
  }

  static double calculateAvarage(){
    double totalGrade=0;
    double totalACTS=0;

    allAddedLessons.forEach((element) {
      totalGrade=totalGrade+(element.letterGrade*element.ects);
      totalACTS+=element.ects;
    });

    return totalGrade/totalACTS;
  }

  static List<String> _allLetterGrades(){
    return ['AA','BA','BB','CB','CC','DC','DD','FD','FF'];
  }
  static List<double> _allECTS(){
    return List.generate(10, (index) => index+1);
  }
    static double _convertLetterToMark(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLetterGrades(){
    return _allLetterGrades().map((e) => DropdownMenuItem(child: Text(e),value: _convertLetterToMark(e),)).toList();
  }

  static List<DropdownMenuItem<double>> allECTS(){
    return _allECTS().map((e) => DropdownMenuItem(
      child: Text(e.toString()),value:e)).toList();
  }
}