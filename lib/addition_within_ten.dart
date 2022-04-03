import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Addition {
  late int _num1;
  late int _num2;

  Addition() {
    generateNumbers(sumMax: 10);
  }

  void generateNumbers({required int sumMax}) {
    bool firstTime = true;
    while (firstTime || _num1 + _num2 > sumMax) {
      _num1 = Random().nextInt(sumMax);
      _num2 = Random().nextInt(sumMax);
      firstTime = false;
    }
  }

  bool isAnswerCorrect({required int answer}) {
    return answer == _num1 + _num2;
  }

  String showQuestion() {
    return '$_num1 + $_num2 =';
  }
}

class AdditionWithinTen extends StatefulWidget {
  const AdditionWithinTen({Key? key}) : super(key: key);

  @override
  State<AdditionWithinTen> createState() => _AdditionWithinTenState();
}

class _AdditionWithinTenState extends State<AdditionWithinTen> {
  Addition addition = Addition();

  final _controller = TextEditingController();
  late FocusNode _focusNode;

  final _textStyle = const TextStyle(
    color: Colors.deepPurple,
    fontSize: 50,
  );

  final correctMsg = const SnackBar(
    duration: Duration(seconds: 1),
    content: Text('Awesome!', style: TextStyle(fontSize: 40)),
  );
  final wrongMsg = const SnackBar(
    duration: Duration(seconds: 1),
    content: Text('Try again.', style: TextStyle(fontSize: 40)),
  );

  @override
  void initState() {
    super.initState();
    addition.generateNumbers(sumMax: 10);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                addition.showQuestion(),
                textAlign: TextAlign.center,
                style: _textStyle,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
              style: _textStyle,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onSubmitted: _resetQuestion,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isAnswerCorrect(String answer) {
    return addition.isAnswerCorrect(answer: int.parse(answer));
  }

  void _resetQuestion(String answer) {
    if (_isAnswerCorrect(answer)) {
      debugPrint('The answer is correct!');
      ScaffoldMessenger.of(context).showSnackBar(correctMsg);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          addition.generateNumbers(sumMax: 10);
          _controller.clear();
          _focusNode.requestFocus();
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(wrongMsg);
      debugPrint('Try again.');
    }
  }
}
