import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget defaultButton(
        {required label,
        required TextStyle? textStyle,
        required Color color,
        Color? borderColor,
        required VoidCallback? onPressed,
        double? spacing,
        String? startIcon,
        String? endIcon}) =>
    ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      color: borderColor != null ? borderColor : color))),
          padding: MaterialStateProperty.all(
              EdgeInsetsDirectional.symmetric(vertical: 4)),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
          maximumSize: MaterialStateProperty.all(Size(double.infinity, 50))),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          endIcon != null ? SvgPicture.asset(endIcon) : Container(),
          endIcon != null ? Spacer() : Container(),
          Text(
            label,
            style: textStyle,
          ),
          startIcon != null ? Spacer() : Container(),
          startIcon != null
              ? SvgPicture.asset(
                  startIcon,
                )
              : Container(),
          Spacer()
        ],
      ),
    );
