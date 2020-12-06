import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  rollLeft();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: () {
                  rollRight();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        ElevatedButton(
          onPressed: () {
            rollDice();
          },
          child: Text(
            'ROLL THE DICE',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),
        ),
      ],
    );
  }

  void rollDice() {
    rollLeft();
    rollRight();
  }

  void rollLeft() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void rollRight() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
