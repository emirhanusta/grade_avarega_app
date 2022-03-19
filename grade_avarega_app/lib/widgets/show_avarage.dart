// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';

class ShowAvarage extends StatelessWidget {
  final double avarage;
  final int numberOfLessons;
  const ShowAvarage({required this.avarage,required this.numberOfLessons, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfLessons>0?'$numberOfLessons Lesson Addded': 'Choose Lesson', style: Constant.showAvaragebody,
        ),
        Text(
          avarage>=0?'${avarage.toStringAsFixed(2)}': '0.0',
          style: Constant.avarageStyle,
        ),
        Text(
          'Avarage',
          style: Constant.showAvaragebody,
        )
      ],
    );
  }
}