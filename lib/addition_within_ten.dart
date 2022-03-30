import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class AdditionWithinTen extends StatefulWidget {
  const AdditionWithinTen({Key? key}) : super(key: key);

  @override
  State<AdditionWithinTen> createState() => _AdditionWithinTenState();
}

class _AdditionWithinTenState extends State<AdditionWithinTen> {
  late int _num1;
  late int _num2;
  final _controller = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _generateNumbers();
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
              child: Text('$_num1 + $_num2 ='),
            ),
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
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

  void _generateNumbers() {
    bool firstTime = true;
    while (firstTime || _num1 + _num2 > 10) {
      _num1 = Random().nextInt(10);
      _num2 = Random().nextInt(10);
      firstTime = false;
    }
  }

  bool _isAnswerCorrect(String answer) {
    return int.parse(answer) == _num1 + _num2;
  }

  void _resetQuestion(String answer) {
    if (_isAnswerCorrect(answer)) {
      debugPrint('The answer is correct!');
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _generateNumbers();
          _controller.clear();
          _focusNode.requestFocus();
        });
      });
    } else {
      debugPrint('Try again.');
    }
  }
}
