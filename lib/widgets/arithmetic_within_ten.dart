import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:haohao/quiz_item.dart';

class ArithmeticWithinTen extends StatefulWidget {
  final QuizCategory arithOp;

  const ArithmeticWithinTen({Key? key, required this.arithOp})
      : super(key: key);

  @override
  State<ArithmeticWithinTen> createState() => _ArithmeticWithinTenState();
}

class _ArithmeticWithinTenState extends State<ArithmeticWithinTen> {
  late final quizItem = QuizItem(widget.arithOp);

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
    quizItem.generateNumbers();
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
                quizItem.showQuestion(),
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
    return quizItem.isCorrect(answer: int.parse(answer));
  }

  void _resetQuestion(String answer) {
    if (_isAnswerCorrect(answer)) {
      debugPrint('The answer is correct!');
      ScaffoldMessenger.of(context).showSnackBar(correctMsg);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          quizItem.generateNumbers();
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
