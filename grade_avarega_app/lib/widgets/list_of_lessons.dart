// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';
import 'package:grade_avarega_app/helper/data_helper.dart';
import 'package:grade_avarega_app/model/lesson.dart';

class ListOfLesson extends StatelessWidget {
  final Function onDismiss;
  const ListOfLesson({required this.onDismiss,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons=DataHelper.allAddedLessons;
    return allLessons.length>0?
     ListView.builder(itemCount:  allLessons.length,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          onDismiss(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            
            child: ListTile(
              title: Text(allLessons[index].name),
              leading: CircleAvatar(
                backgroundColor:Constant.mainColor ,
                child: Text(allLessons[index].name[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
              ),
              subtitle: Text(
                '${allLessons[index].ects} ects, letter grade ${allLessons[index].letterGrade}'
              ),
            ),
          ),
        ),
      );
    })
    : Center(
      child: Container(
        child: Text('please add lesson',style: Constant.titleStyle,),
      ),
    );
  }
}