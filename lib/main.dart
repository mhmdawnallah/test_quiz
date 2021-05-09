import 'package:flutter/material.dart';
import 'package:test_quiz/pages/classic_question_quiz.dart';

void main() {
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ClassicQuestionScreen(),
      ),
    );
  }
}


