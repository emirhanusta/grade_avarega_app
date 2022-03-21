import 'package:flutter/material.dart';
import 'package:grade_avarega_app/constants/app_constants.dart';
import 'package:grade_avarega_app/helper/data_helper.dart';

class ECTSDropdownWidget extends StatefulWidget {
  final Function onECTSEntered;
  ECTSDropdownWidget({required this.onECTSEntered,Key? key}) : super(key: key);

  @override
  State<ECTSDropdownWidget> createState() => _ECTSDropdownWidgetState();
}

class _ECTSDropdownWidgetState extends State<ECTSDropdownWidget> {
      double selectedValueECTS=1;

  @override
  Widget build(BuildContext context) {
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
                widget.onECTSEntered(enteredValue);
              });
            },
            underline: Container(),
            items: DataHelper.allECTS(),
          ),
        ),
      ),
    );;
  }
}