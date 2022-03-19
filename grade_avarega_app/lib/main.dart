import 'package:flutter/material.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';
import 'package:grade_avarega_app/widgets/calculate_avarage_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Avarege',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constant.mainColor,
      ),
      home: CalculateAvaragePage(),
    );
  }
}