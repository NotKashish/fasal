import 'package:fasal/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.isEnabled,
    this.keyboardType,
    this.labelStyle,
    this.obscureText = false,
  }) : super(key: key);


  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final bool? isEnabled;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          enabled: isEnabled,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: labelText,
            hintText: hintText,
            enabled: isEnabled ?? true,
            labelStyle: labelStyle ??
                TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: black,
                style: BorderStyle.solid,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: black.withOpacity(0.2),
                style: BorderStyle.solid,
                width: 1.5,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                style: BorderStyle.solid,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
