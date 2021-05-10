import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_quiz/bloc/question-bloc.dart';
import 'package:test_quiz/pages/another_question_way.dart';
import 'package:test_quiz/pages/classic_question_quiz.dart';

void main() {
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionBloc>(
      create: (context) {
        return QuestionBloc();
      },
      child: MaterialApp(
        home: Scaffold(
          body: AnotherWay(),
        ),
      ),
    );
  }
}


