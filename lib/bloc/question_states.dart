import 'package:flutter/material.dart';
import 'package:test_quiz/models/game_sessions_model.dart';

abstract class QuestionStates{}

class InitialQuizState extends QuestionStates{
}
class StartQuiz extends QuestionStates{
  var response;
  StartQuiz({@required response,});
}
class CorrectAnswerState extends QuestionStates{
  var response;
  CorrectAnswerState({@required response,});
}
class WrongAnswerState extends QuestionStates{
  var error ;
  WrongAnswerState({@required this.error,});
}
