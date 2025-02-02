import 'package:flutter/material.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';
import 'package:general_app/l10n/l10n.dart';

class Numbers {
  static const String zero = '0';
  static const String one = '1';
  static const String two = '2';
  static const String three = '3';
  static const String four = '4';
  static const String five = '5';
  static const String six = '6';
  static const String seven = '7';
  static const String eight = '8';
  static const String nine = '9';
}

class Operators {
  static const String plus = '+';
  static const String minus = '-';
  static const String multiply = 'x';
  static const String devide = '/';
}

class Others {
  static const String allClear = 'AC';
  static const String dot = '.';
  static const String equals = '=';
  static const String percent = '%';
  static const String clearEnd = '⌫';
  static const String plusminus = '±';
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorScreen> {
  String history = "";
  String input = "0";
  String oldInput = "0";
  String operation = "";
  bool isNumbers = false;
  bool isEqual = false;
  bool isPlus = true;

  onButtonClick(String value) {
    switch (value) {
      case Numbers.zero:
        if (input != Numbers.zero) {
          input += value;
        }
        isNumbers = true;
        break;
      case Numbers.one:
      case Numbers.two:
      case Numbers.three:
      case Numbers.four:
      case Numbers.five:
      case Numbers.six:
      case Numbers.seven:
      case Numbers.eight:
      case Numbers.nine:
        if (input == Numbers.zero) {
          input = value;
        } else {
          if (isNumbers) {
            input += value;
          } else {
            input = value;
          }
        }
        oldInput = input;
        isNumbers = true;
        isEqual = false;
        break;
      case Operators.plus:
      case Operators.minus:
      case Operators.multiply:
      case Operators.devide:
        cal(value);
        oldInput = input;
        isNumbers = false;
        isEqual = false;
        break;
      case Others.equals:
        String number = isEqual? input: history.split(RegExp(r'[+\-x/=]'))[0].trim();
        String operation =
            RegExp(r'[+\-x/]').allMatches(history).first.group(0)!;
        double? result = double.tryParse(number);
        double? result1 = double.tryParse(oldInput);
        switch (operation) {
          case Operators.plus:
            input = (result! + result1!).toString();
          case Operators.minus:
            input = (result! - result1!).toString();
          case Operators.multiply:
            input = (result! * result1!).toString();
          case Operators.devide:
            input = (result! / result1!).toString();
        }
        if (!isEqual) {
          history = '$history $oldInput ${Others.equals}';
          isEqual = true;
        } else {
          history = '$number $operation $oldInput ${Others.equals}';
        }
        isNumbers = false;
        break;
      case Others.allClear:
        history = "";
        input = Numbers.zero;
        isNumbers = false;
        break;
      case Others.clearEnd:
        input = input.substring(0, input.length - 1);
        if (input.isEmpty) {
          input = Numbers.zero;
        }
        isNumbers = false;
        break;
      case Others.dot:
        List<String> dots = input.split(Others.dot);
        if (dots.length == 1) {
          input += Others.dot;
        }
        isNumbers = true;
        break;
      case Others.percent:
        input = '${double.tryParse(input)! / 100}';
        isNumbers = false;
        break;
      case Others.plusminus:
        isPlus = !isPlus;
        isNumbers = false;
        break;
    }

    setState(() {});
  }

  void cal(String currentOperation) {
    if (input.endsWith('.')) {
      input = input.substring(0, input.indexOf('.'));
    } else if (input.split('.').length > 1 &&
        int.tryParse(input.split('.')[1]) == 0) {
      input = input.substring(0, input.indexOf('.'));
    }
    if (history.isNotEmpty && isNumbers) {
      String number = history.split(RegExp(r'[+\-x/]'))[0].trim();
      String operation = RegExp(r'[+\-x/]').allMatches(history).first.group(0)!;
      double? result = double.tryParse(number);
      double? result1 = double.tryParse(input);
      switch (operation) {
        case Operators.plus:
          input = (result! + result1!).toString();
        case Operators.minus:
          input = (result! - result1!).toString();
        case Operators.multiply:
          input = (result! * result1!).toString();
        case Operators.devide:
          input = (result! / result1!).toString();
      }
    }
    history = '$input $currentOperation';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppPageHeader(name: AppLocalizations.of(context).calendar),
      Expanded(
          child: Container(
        padding: EdgeInsets.all(AppSizes.s5),
        margin: EdgeInsets.all(AppSizes.s5),
        decoration: BoxDecoration(
          color: context.appTheme.colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.s20)),
        ),
        child: Column(children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  history,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  input,
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
          //buttons area
          Row(
            children: [
              button(text: Others.allClear),
              button(text: Others.percent),
              button(text: Others.clearEnd),
              button(text: Operators.devide),
            ],
          ),
          Row(
            children: [
              button(text: Numbers.seven),
              button(text: Numbers.eight),
              button(text: Numbers.nine),
              button(text: Operators.multiply),
            ],
          ),
          Row(
            children: [
              button(text: Numbers.four),
              button(text: Numbers.five),
              button(text: Numbers.six),
              button(text: Operators.minus),
            ],
          ),
          Row(
            children: [
              button(text: Numbers.one),
              button(text: Numbers.two),
              button(text: Numbers.three),
              button(text: Operators.plus),
            ],
          ),
          Row(
            children: [
              button(text: Others.plusminus),
              button(text: Numbers.zero),
              button(text: Others.dot),
              button(text: Others.equals),
            ],
          ),
        ]),
      ))
    ]);
  }

  Widget button({text, tColor = Colors.white}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
