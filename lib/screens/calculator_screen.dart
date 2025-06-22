import 'package:flutter/material.dart';
import '../widgets/basic_calculator.dart';
import '../widgets/scientific_calculator.dart';
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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

  void _onScientificOperation(String op) {
    try {
      double currentNumber = double.parse(display);
      result = CalculatorLogic.performScientificOperation(op, currentNumber);
      setState(() {
        display = CalculatorLogic.formatResult(result);
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
      body: Column(
        children: [
          Container(
            color: AppConstants.backgroundColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppConstants.operatorColor,
              tabs: [
                Tab(icon: Icon(Icons.calculate), text: AppConstants.basicTab),
                Tab(icon: Icon(Icons.functions), text: AppConstants.scientificTab),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BasicCalculator(
                  display: display,
                  onNumberPressed: _onNumberPressed,
                  onOperatorPressed: _onOperatorPressed,
                  onClear: _clear,
                  onDecimalPressed: _onDecimalPressed,
                  onPlusMinusPressed: _onPlusMinusPressed,
                  onCalculate: _calculate,
                ),
                ScientificCalculator(
                  display: display,
                  onNumberPressed: _onNumberPressed,
                  onOperatorPressed: _onOperatorPressed,
                  onScientificOperation: _onScientificOperation,
                  onClear: _clear,
                  onDecimalPressed: _onDecimalPressed,
                  onPlusMinusPressed: _onPlusMinusPressed,
                  onCalculate: _calculate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
