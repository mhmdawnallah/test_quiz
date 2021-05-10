import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_quiz/backend/question_operations.dart';
import 'package:test_quiz/bloc/question_events.dart';
import 'package:test_quiz/bloc/question_states.dart';
import 'package:test_quiz/models/game_sessions_model.dart';

class QuestionBloc extends Bloc<QuestionEvents, QuestionStates> {
  late String answer;
  late QuestionFunctions _questionFunctions = QuestionFunctions();

  QuestionBloc() : super(InitialQuizState());

  @override
  Stream<QuestionStates> mapEventToState(QuestionEvents event) async* {
    if(event is InitialEvent){
      var response = _questionFunctions.getFirstQuestion();
      print(response.answer2);
      yield StartQuiz(response: response);
    }else if (event is CheckAnswerEvent) {
      try{
        var response = _questionFunctions.checkAnswer(answer);
        if(response != false){
          yield CorrectAnswerState(response: response);
        }else {
          yield WrongAnswerState(error: 'wrong');
        }
      }catch(e){
        yield WrongAnswerState(error: "error");
      }
    }
  }
}
