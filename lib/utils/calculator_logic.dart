import 'dart:math' as math;

class CalculatorLogic {
  static String formatResult(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value
          .toStringAsFixed(8)
          .replaceAll(RegExp(r'0*$'), '')
          .replaceAll(RegExp(r'\.$'), '');
    }
  }

  static double performBasicOperation(
      String operation, double operand1, double operand2) {
    switch (operation) {
      case '+':
        return operand1 + operand2;
      case '-':
        return operand1 - operand2;
      case '*':
        return operand1 * operand2;
      case '/':
        if (operand2 != 0) {
          return operand1 / operand2;
        } else {
          throw Exception('Division by zero is not allowed.');
        }
      case '%':
        return operand1 % operand2;
      default:
        throw Exception('Invalid operation: $operation');
    }
  }

  static double performScientificOperation(String operation, double operand) {
    switch (operation) {
      case 'sin':
        return math.sin(operand * math.pi / 180);
      case 'cos':
        return math.cos(operand * math.pi / 180);
      case 'tan':
        return math.tan(operand * math.pi / 180);
      case 'sqrt':
        if (operand < 0) throw Exception('Invalid input for square root');
        return math.sqrt(operand);
      case 'log':
        if (operand <= 0) throw Exception('Invalid input for log');
        return math.log(operand) / math.ln10;
      case 'ln':
        if (operand <= 0) throw Exception('Invalid input for ln');
        return math.log(operand);
      case 'exp':
        return math.exp(operand);
      case 'sqr':
        return operand * operand;
      case 'rec':
        if (operand == 0) throw Exception('Invalid input for reciprocal');
        return 1 / operand;
      case 'abs':
        return operand.abs();
      default:
        throw Exception('Invalid operation: $operation');
    }
  }
}
