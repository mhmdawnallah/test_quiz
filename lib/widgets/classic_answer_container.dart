import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animated_button.dart';

class ClassicAnswerContainer extends StatefulWidget {
  ClassicAnswerContainer({
    Key? key,
    required this.answer,
    required this.correctAnswer,
    required this.showCorrect,
    required this.onPressed,
  }) : super(key: key);

  final String? answer;
  final String? correctAnswer;
  final bool showCorrect;
  final Function onPressed;

  @override
  _ClassicAnswerContainerState createState() => _ClassicAnswerContainerState();
}

class _ClassicAnswerContainerState extends State<ClassicAnswerContainer> {
  @override
  Widget build(BuildContext context) {
    Color textColor =
    widget.showCorrect && widget.answer != widget.correctAnswer
        ? Colors.red
        : Color(0xff0057a9);
    return AnimatedButton(
      onPressed: () async {
        if (Platform.isIOS) {
          HapticFeedback.lightImpact();
        } else {
          HapticFeedback.vibrate();
        }
        await widget.onPressed(widget.answer);
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        width:  null,
        margin: EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.showCorrect && widget.answer == widget.correctAnswer
                  ? "assets/images/right_answer_container.png"
                  : "assets/images/answer_container.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            widget.answer!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "BalooThambi",
              color: textColor,
              fontSize:  18,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
