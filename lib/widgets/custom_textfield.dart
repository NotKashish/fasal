import 'package:fasal/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.maxLines,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.isEnabled,
    this.keyboardType,
    this.labelStyle,
  }) : super(key: key);
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final int? maxLines;
  final FormFieldValidator? validator;
  final bool? isEnabled;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
          enabled: isEnabled,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: labelText,
            hintText: hintText,
            enabled: isEnabled ?? true,
            labelStyle: labelStyle ??
                TextStyle(
                  color: Black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Black,
                style: BorderStyle.solid,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Black.withOpacity(0.2),
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
