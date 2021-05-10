import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_quiz/bloc/question-bloc.dart';
import 'package:test_quiz/bloc/question_events.dart';
import 'package:test_quiz/bloc/question_states.dart';
import 'package:test_quiz/models/game_sessions_model.dart';

class AnotherWay extends StatefulWidget {
  @override
  _AnotherWayState createState() => _AnotherWayState();
}

class _AnotherWayState extends State<AnotherWay> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var questionProvider = BlocProvider.of<QuestionBloc>(context);
    questionProvider.add(InitialEvent());

    return Scaffold(
      body: BlocListener<QuestionBloc, QuestionStates>(
        listener: (context, state) {
          if (state is WrongAnswerState) {
            snackbarValidate(state.error, context);
          }
        },
        child: BlocBuilder<QuestionBloc, QuestionStates>(
          builder: (context, state) {
            late var result ;
            if (state is StartQuiz) {
              result = state.response ;
            } else if (state is CorrectAnswerState) {
              result = state.response ;
            }
            return Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playAudio(result.media),
                  InkWell(
                    onTap: () {
                      questionProvider.answer = result.answer1;
                      questionProvider.add(CheckAnswerEvent());
                    },
                    child: Text(result.answer1),
                  ),
                  InkWell(
                    onTap: () {
                      questionProvider.answer = result.answer2;
                      questionProvider.add(CheckAnswerEvent());
                    },
                    child: Text(result.answer2),
                  ),
                  InkWell(
                    onTap: () {
                      questionProvider.answer = result.answer3;
                      questionProvider.add(CheckAnswerEvent());
                    },
                    child: Text(result.answer3),
                  ),
                  InkWell(
                    onTap: () {
                      questionProvider.answer = result.answer4;
                      questionProvider.add(CheckAnswerEvent());
                    },
                    child: Text(result.answer4),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void snackbarValidate(String s, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          s,
        ),
      ),
    );
  }

  playAudio(media) async{
    await audioPlayer.play(media);
  }
}
