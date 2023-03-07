
import 'package:flutter/material.dart';

Widget defaultSearchTextFormField(
    {required String textHint,
       IconData? prefixIcon,
      required TextEditingController controller,
      required TextInputType textInputType,
      ValueChanged? onSubmit,
      ValueChanged<String>? onChanged,
      FormFieldValidator? validate,
      String? label,
      bool obscure = false,
      VoidCallback? onTab,
      required IconData suffixIcon,
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
              top: BorderSide(width: 1,color: Colors.grey[300]!),
              bottom: BorderSide(width: 1,color: Colors.grey[300]!),
              left: BorderSide(width: 1,color: Colors.grey[300]!),
              right: BorderSide(width: 1,color: Colors.grey[300]!)),
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
              hintStyle: TextStyle(wordSpacing: 5,),

              label: label!=null?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label),
              ):null,
              prefixIcon: SizedBox(width: 2,),
              suffixIcon: Container(
                color: Colors.grey[200],
                height: 60,
                padding: EdgeInsets.all(4),
                child: IconButton(
                  onPressed: onPressSuffix,
                  icon: Icon(suffixIcon,color: Colors.black,),
                ),
              ),
              fillColor: Colors.white),
        ),
      ),
    );
