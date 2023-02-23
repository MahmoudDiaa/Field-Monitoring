import 'package:flutter/material.dart';

Widget defaultButton({required label ,required TextStyle? textStyle,required Color color,required VoidCallback? onPressed})=>ElevatedButton(
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          color),
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
  onPressed: onPressed,
  child: Text(
   label,
    style:textStyle,
  ),
);