import 'package:flutter/material.dart';

Widget defaultNoteTextFormField(
        {required String textHint,
        Widget? prefixWidget,
        required TextEditingController controller,
        required TextInputType textInputType,
        ValueChanged? onSubmit,
        ValueChanged? onChanged,
        FormFieldValidator? validate,
        String? label,
        bool obscure = false,
        VoidCallback? onTab,
        Widget? suffixWidget,
        bool isClickable = true,
        TextInputAction textInputAction = TextInputAction.next,
        VoidCallback? onPressSuffix,
        String? textContent,
          double? height,
          double? width,
        FocusNode? focusNode}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 1, color: Colors.grey[300]!),
              bottom: BorderSide(width: 1, color: Colors.grey[300]!),
              left: BorderSide(width: 1, color: Colors.grey[300]!),
              right: BorderSide(width: 1, color: Colors.grey[300]!)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: onSubmit,
          onChanged: onChanged,
          validator: validate,
          focusNode: focusNode,
          obscureText: obscure,
          onTap: onTab,
          enabled: isClickable,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              hintText: textHint,
              hintStyle: TextStyle(
                wordSpacing: 5,
              ),
              label: label != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(label),
                    )
                  : null,
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  prefixWidget != null ? prefixWidget : Container(),
                  SizedBox(
                    width: 2,
                  )
                ],
              ),
              suffixIcon: suffixWidget!=null?Container(
                color: Colors.grey[200],
                height: 60,
                width: 20,
                padding: EdgeInsets.all(4),
                child: Center(child: suffixWidget),
              ):Container(),
              fillColor: Colors.white),
        ),
      ),
    );
