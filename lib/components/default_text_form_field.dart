import 'package:flutter/material.dart';

Widget defaultTextFormField(
        {required String textHint,
        required IconData prefixIcon,
        required TextEditingController controller,
        required TextInputType textInputType,
        ValueChanged? onSubmit,
        ValueChanged? onChanged,
        FormFieldValidator? validate,
        String? label,
        bool obscure = false,
        VoidCallback? onTab,
        IconData? suffixIcon,
        bool isClickable = true,
        TextInputAction textInputAction = TextInputAction.next,
        VoidCallback? onPressSuffix,
        String? textContent
        ,FocusNode? focusNode }) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 1,color: Colors.grey[400]!),
              bottom: BorderSide(width: 1,color: Colors.grey[400]!),
              left: BorderSide(width: 1,color: Colors.grey[400]!),
              right: BorderSide(width: 1,color: Colors.grey[400]!)),
          borderRadius: BorderRadius.circular(10),

        ),
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: onSubmit,
          onChanged: onChanged,
          validator: validate,
          focusNode:focusNode ,
          obscureText: obscure,
          onTap: onTab,
          enabled: isClickable,
          textInputAction: textInputAction,
          decoration: InputDecoration(
              hintText: textHint,
            label: label!=null?Text(label):null,
              prefixIcon: Container(
                child: Icon(prefixIcon, size: 20),
                color: Colors.grey[200],
                height: 60,
              ),
              suffixIcon: IconButton(
                onPressed: onPressSuffix,
                icon: Icon(suffixIcon),
              ),
              fillColor: Colors.white),
        ),
      ),
    );
