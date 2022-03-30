import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class AdditionWithinTen extends StatefulWidget {
  const AdditionWithinTen({Key? key}) : super(key: key);

  @override
  State<AdditionWithinTen> createState() => _AdditionWithinTenState();
}

class _AdditionWithinTenState extends State<AdditionWithinTen> {
  int _num1 = Random().nextInt(10);
  int _num2 = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('$_num1 + $_num2 ='),
            ),
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: _checkAnswer,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          OutlinedButton(
            child: Text("Next"),
            onPressed: _generateNumbers,
          ),
        ],
      ),
    );
  }

  void _generateNumbers() {
    setState(() {
      bool firstTime = true;
      while (firstTime || _num1 + _num2 > 10) {
        _num1 = Random().nextInt(10);
        _num2 = Random().nextInt(10);
        firstTime = false;
      }
    });
  }

  void _checkAnswer(String answer) {
    if (int.parse(answer) == _num1 + _num2) {
      debugPrint('The answer is correct!');
    } else {
      debugPrint('Try again.');
    }
  }
}
