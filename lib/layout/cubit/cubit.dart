import 'package:calculator/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcCubit extends Cubit<CalcStates> {
  CalcCubit() : super(CalcInitialState());

  static CalcCubit get(context) => BlocProvider.of(context);

  var equation = "0";
  var result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      equation = "0";
      result = "0";
      equationFontSize = 38.0;
      resultFontSize = 48.0;
    } else if (buttonText == "=") {
      equationFontSize = 38.0;
      resultFontSize = 48.0;

      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = "Error";
      }
    } else {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      if (equation == "0") {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }
    emit(CalcPressedState());
  }
}
