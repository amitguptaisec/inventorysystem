import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.labelText,
    this.border,
    this.labelStyle,
    this.filled,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AppTextStyles.body1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body2,
        labelText: labelText,
        labelStyle: labelStyle,
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
      ),
    );
  }
}
