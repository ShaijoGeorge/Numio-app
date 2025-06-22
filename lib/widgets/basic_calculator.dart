import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/calculator_button.dart';

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
                // Buttons
                Expanded(
                    flex: 4,
                    child: Column(
                        children: [
                            // Row 1
                            Expanded(
                                child: Row(
                                    children: [
                                        Expanded(child: CalculatorButton(
                                            text: 'C',
                                            onPressed: onClear,
                                            color: AppConstants.clearColor,
                                        )),
                                            Expanded(child: CalculatorButton(
                                            text: '( )',
                                            onPressed: () {},
                                            color: AppConstants.operatorColor,
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '%',
                                            onPressed: () => onOperatorPressed('%'),
                                            color: AppConstants.operatorColor,
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '÷',
                                            onPressed: () => onOperatorPressed('÷'),
                                            color: AppConstants.operatorColor,
                                        )),
                                    ],
                                ),
                            ),
                            // Row 2
                            Expanded(
                                child: Row(
                                    children: [
                                        Expanded(child: CalculatorButton(
                                            text: '7',
                                            onPressed: () => onNumberPressed('7'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '8',
                                            onPressed: () => onNumberPressed('8'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '9',
                                            onPressed: () => onNumberPressed('9'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '×',
                                            onPressed: () => onOperatorPressed('×'),
                                            color: AppConstants.operatorColor,
                                        )),
                                    ],
                                ),
                            ),
                            // Row 3
                            Expanded(
                                child: Row(
                                    children: [
                                        Expanded(child: CalculatorButton(
                                            text: '4',
                                            onPressed: () => onNumberPressed('4'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '5',
                                            onPressed: () => onNumberPressed('5'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '6',
                                            onPressed: () => onNumberPressed('6'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '-',
                                            onPressed: () => onOperatorPressed('-'),
                                            color: AppConstants.operatorColor,
                                        )),
                                    ],
                                ),
                            ),
                            // Row 4
                            Expanded(
                                child: Row(
                                    children: [
                                        Expanded(child: CalculatorButton(
                                            text: '1',
                                            onPressed: () => onNumberPressed('1'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '2',
                                            onPressed: () => onNumberPressed('2'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '3',
                                            onPressed: () => onNumberPressed('3'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '+',
                                            onPressed: () => onOperatorPressed('+'),
                                            color: AppConstants.operatorColor,
                                        )),
                                    ],
                                ),
                            ),
                            // Row 5
                            Expanded(
                                child: Row(
                                    children: [
                                        Expanded(child: CalculatorButton(
                                            text: '+/-',
                                            onPressed: onPlusMinusPressed,
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '0',
                                            onPressed: () => onNumberPressed('0'),
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '.',
                                            onPressed: onDecimalPressed,
                                        )),
                                        Expanded(child: CalculatorButton(
                                            text: '=',
                                            onPressed: onCalculate,
                                            color: AppConstants.operatorColor,
                                        )),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ],
        );
    }
}
