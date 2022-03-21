import 'package:flutter/material.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';
import 'package:grade_avarega_app/helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
    final Function onLetterEntered;

  LetterDropdownWidget({required this.onLetterEntered,Key? key}) : super(key: key);
  @override
  State<LetterDropdownWidget> createState() => _LeeterDropdownWidgetState();
}

class _LeeterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedValueLetterGrade=4;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          alignment: Alignment.center,
          padding: Constant.dropdownPadding,
          decoration: BoxDecoration(
            color: Constant.mainColor.shade100.withOpacity(0.9),
            borderRadius: Constant.borderRadius,
          ),
          child: DropdownButton<double>(
            value: selectedValueLetterGrade,
            elevation: 16,
            iconEnabledColor: Constant.mainColor.shade300,
            onChanged: (enteredValue){
              setState(() {
                selectedValueLetterGrade=enteredValue!;
                widget.onLetterEntered(enteredValue);
              });
            },
            underline: Container(),
            items: DataHelper.allLetterGrades(),
          ),
        ),
      ),
    );;
  }
}