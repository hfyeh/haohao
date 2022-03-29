import 'package:flutter/material.dart';
import 'dart:math';

class AdditionWithinTen extends StatefulWidget {
  const AdditionWithinTen({Key? key}) : super(key: key);

  @override
  State<AdditionWithinTen> createState() => _AdditionWithinTenState();
}

class _AdditionWithinTenState extends State<AdditionWithinTen> {
  final int _num1 = Random().nextInt(10);
  final int _num2 = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('$_num1 + $_num2 ='),
            ),
          ),
          const Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Answer is ?',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
