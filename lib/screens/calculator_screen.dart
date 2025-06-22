import 'package:flutter/material.dart';
import '../widgets/basic_calculator.dart';
import '../utils/calculator_logic.dart';
import '../constants/app_constants.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> with TickerProviderStateMixin {
  String display = '0';
  String equation = '';
  double result = 0;
  String operation = '';
  double operand = 0;
  bool shouldResetDisplay = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (display == '0' || shouldResetDisplay) {
        display = number;
        shouldResetDisplay = false;
      } else {
        display += number;
      }
    });
  }

  void _onOperatorPressed(String op) {
    setState(() {
      if (operation.isNotEmpty && !shouldResetDisplay) {
        _calculate();
      }
      operation = op;
      operand = double.parse(display);
      shouldResetDisplay = true;
    });
  }

  void _calculate() {
    try {
      double currentNumber = double.parse(display);
      result = CalculatorLogic.performBasicOperation(operation, operand, currentNumber);
      setState(() {
        display = CalculatorLogic.formatResult(result);
        operation = '';
        shouldResetDisplay = true;
      });
    } catch (e) {
      setState(() {
        display = AppConstants.error;
        shouldResetDisplay = true;
      });
    }
  }

  void _clear() {
    setState(() {
      display = '0';
      equation = '';
      result = 0;
      operation = '';
      operand = 0;
      shouldResetDisplay = false;
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (shouldResetDisplay) {
        display = '0.';
        shouldResetDisplay = false;
      } else if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  void _onPlusMinusPressed() {
    setState(() {
      if (display != '0') {
        if (display.startsWith('-')) {
          display = display.substring(1);
        } else {
          display = '-' + display;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicCalculator(
        display: display,
        onNumberPressed: _onNumberPressed,
        onOperatorPressed: _onOperatorPressed,
        onClear: _clear,
        onDecimalPressed: _onDecimalPressed,
        onPlusMinusPressed: _onPlusMinusPressed,
        onCalculate: _calculate,
      ),
    );
  }

}
