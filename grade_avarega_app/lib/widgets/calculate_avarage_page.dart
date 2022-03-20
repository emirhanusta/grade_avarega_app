// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';
import 'package:grade_avarega_app/helper/data_helper.dart';
import 'package:grade_avarega_app/model/lesson.dart';
import 'package:grade_avarega_app/widgets/list_of_lessons.dart';
import 'package:grade_avarega_app/widgets/show_avarage.dart';

class CalculateAvaragePage extends StatefulWidget {
  CalculateAvaragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAvaragePage> createState() => _CalculateAvaragePageState();
}

class _CalculateAvaragePageState extends State<CalculateAvaragePage> {
    double selectedValueLetterGrade=4;
    double selectedValueECTS=1;
    String enteredLessonName='';
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Constant.appbarTitle,style: Constant.titleStyle,),
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        //form
          Row(
            children: [
              Expanded(
                flex: 5,
                child: _buildForm()
                ),
              Expanded(
                flex: 3,
                child: ShowAvarage(avarage: DataHelper.calculateAvarage(), numberOfLessons: DataHelper.allAddedLessons.length)
                )
            ],
          ),
        //list
        Expanded(
          child: ListOfLesson(
            onDismiss: (index){
              DataHelper.allAddedLessons.removeAt(index);
              setState(() {
                
              });
            },
          ),
        )
      ],)
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child:Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildTextFromField(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLetterGrade(),
            _buildECTS(),
            IconButton(onPressed: _addLessonAndCalculateAvarage, icon: Icon(Icons.arrow_forward_ios),color: Constant.mainColor,),
          ],
        ),
        SizedBox(height: 5,)
      ],) ,
    );
  }

 TextFormField _buildTextFromField() {
    return TextFormField(
      onSaved: (value){
        setState(() {
          enteredLessonName=value!;
        });
      },
      validator: (s){
        if (s!.length<=0) {
          return 'Enter Lesson Name';
        }
        else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'enter a lesson',
        border: OutlineInputBorder(borderRadius: Constant.borderRadius,borderSide:BorderSide.none),
        filled: true,
        fillColor: Constant.mainColor.shade100,
      ),
    );
  }

  _buildLetterGrade() {
    return Expanded(
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
              });
            },
            underline: Container(),
            items: DataHelper.allLetterGrades(),
          ),
        ),
      ),
    );
  }

  _buildECTS() {
    return Expanded(
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
            value: selectedValueECTS,
            elevation: 16,
            iconEnabledColor: Constant.mainColor.shade300,
            onChanged: (enteredValue){
              setState(() {
                selectedValueECTS=enteredValue!;
              });
            },
            underline: Container(),
            items: DataHelper.allECTS(),
          ),
        ),
      ),
    );
  }

   _addLessonAndCalculateAvarage() {
   if (formKey.currentState!.validate()) {
     formKey.currentState!.save();
     var lessonToBeAdded=Lesson(name: enteredLessonName, letterGrade:selectedValueLetterGrade, ects: selectedValueECTS);
     DataHelper.addLesson(lessonToBeAdded);
      setState(() {});
    }
 }
}

