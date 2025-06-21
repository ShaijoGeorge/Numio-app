import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppConstants.buttonMargin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppConstants.buttonColor,
          foregroundColor: textColor ?? AppConstants.textColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(AppConstants.buttonPadding),
          elevation: 2,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? AppConstants.buttonFontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    );
  }
}
