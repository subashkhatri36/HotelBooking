import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    Key? key,
    required this.hintText,
    required this.data,
  }) : super(key: key);
  final String hintText;
  final List<String> data;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        underline: Padding(
          padding: EdgeInsets.all(5),
        ),
        isExpanded: true,
        icon: CircleAvatar(
          radius: Constants.defaultRadus / 2,
          backgroundColor: AppColors.WHITE,
          child: Icon(Icons.keyboard_arrow_down, color: AppColors.BLACK),
        ),
        value: _chosenValue,
        style: TextStyle(color: Colors.black),
        dropdownColor: AppColors.WHITE,
        items: widget.data.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: NormalText(
              value,
              color: AppColors.GREY,
            ),
          );
        }).toList(),
        hint: NormalText(
          widget.hintText,
          color: AppColors.GREY,
        ),
        onChanged: (value) {
          setState(() {
            _chosenValue = value!;
          });
        },
      ),
    );
  }
}
