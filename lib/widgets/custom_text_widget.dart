import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.textsyle,
    this.onPressed,
    this.onClick = false,
  });
  final String text;
  final TextStyle? textsyle;
  final VoidCallback? onPressed;
  final bool onClick;

  @override
  Widget build(BuildContext context) {
    return onClick
        ? TextButton(
            onPressed: onPressed,
            child: Text(text, style: textsyle),
          )
        : Text(text, style: textsyle);
  }
}
