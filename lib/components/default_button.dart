import 'package:flutter/material.dart';

Widget defaultButton({required label ,required TextStyle? textStyle,required Color color})=>ElevatedButton(
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          Colors.green),
      shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5),
              side: BorderSide(
                  color:color))),
      padding: MaterialStateProperty.all(
          EdgeInsetsDirectional.symmetric(
              vertical: 10)),
      minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 20))),
  onPressed: () {},
  child: Text(
   label,
    style:textStyle,
  ),
);