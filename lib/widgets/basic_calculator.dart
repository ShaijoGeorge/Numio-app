import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class BasicCalculator extends StatelessWidget {
    final String display;
    final Function(String) onNumberPressed;
    final Function(String) onOperatorPressed;
    final VoidCallback onClear;
    final VoidCallback onDecimalPressed;
    final VoidCallback onPlusMinusPressed;
    final VoidCallback onCalculate;

    const BasicCalculator({
        Key? key,
        required this.display,
        required this.onNumberPressed,
        required this.onOperatorPressed,
        required this.onClear,
        required this.onDecimalPressed,
        required this.onPlusMinusPressed,
        required this.onCalculate,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                // Display
                Expanded(
                    flex: 2,
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                                Text(
                                    display,
                                    style: TextStyle(
                                    fontSize: AppConstants.displayFontSize,
                                    fontWeight: FontWeight.w300,
                                    color: AppConstants.textColor,
                                    ),
                                    textAlign: TextAlign.right,
                                ),
                            ],
                        ),
                    ),
                ),
            ]
        );
    }
}
