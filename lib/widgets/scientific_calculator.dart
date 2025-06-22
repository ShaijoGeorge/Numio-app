import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/calculator_button.dart';
import '../constants/app_constants.dart';

class ScientificCalculator extends StatelessWidget {
  final String display;
  final Function(String) onNumberPressed;
  final Function(String) onOperatorPressed;
  final Function(String) onScientificOperation;
  final VoidCallback onClear;
  final VoidCallback onDecimalPressed;
  final VoidCallback onPlusMinusPressed;
  final VoidCallback onCalculate;

  const ScientificCalculator({
    Key? key,
    required this.display,
    required this.onNumberPressed,
    required this.onOperatorPressed,
    required this.onScientificOperation,
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
          flex: 1,
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
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: AppConstants.textColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
        // Scientific Buttons
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // Row 1 - Functions
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: CalculatorButton(
                      text: '⟲',
                      onPressed: () {},
                      fontSize: 18,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'Rad',
                      onPressed: () {},
                      fontSize: AppConstants.scientificFontSize,
                    )),
                    Expanded(child: CalculatorButton(
                      text: '√',
                      onPressed: () => onScientificOperation('√'),
                      fontSize: 20,
                    )),
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
                      text: 'sin',
                      onPressed: () => onScientificOperation('sin'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'cos',
                      onPressed: () => onScientificOperation('cos'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'tan',
                      onPressed: () => onScientificOperation('tan'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
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
                      text: 'ln',
                      onPressed: () => onScientificOperation('ln'),
                      fontSize: 18,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'log',
                      onPressed: () => onScientificOperation('log'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
                    Expanded(child: CalculatorButton(
                      text: '1/x',
                      onPressed: () => onScientificOperation('1/x'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
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
                      text: 'eˣ',
                      onPressed: () => onScientificOperation('e^x'),
                      fontSize: AppConstants.scientificFontSize,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'x²',
                      onPressed: () => onScientificOperation('x²'),
                      fontSize: 18,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'xʸ',
                      onPressed: () => onScientificOperation('x^y'),
                      fontSize: 18,
                    )),
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
                      text: '|x|',
                      onPressed: () => onScientificOperation('|x|'),
                      fontSize: 18,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'π',
                      onPressed: () => onNumberPressed(math.pi.toString()),
                      fontSize: 20,
                    )),
                    Expanded(child: CalculatorButton(
                      text: 'e',
                      onPressed: () => onNumberPressed(math.e.toString()),
                      fontSize: 20,
                    )),
                    Expanded(child: CalculatorButton(
                      text: '+/-',
                      onPressed: onPlusMinusPressed,
                      fontSize: AppConstants.scientificFontSize,
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