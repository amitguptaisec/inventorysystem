import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? appbarbackgroundColor;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.textStyle,
    this.backgroundColor,
    this.appbarbackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbarbackgroundColor,
        title: CustomText(text: title, textsyle: textStyle),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
