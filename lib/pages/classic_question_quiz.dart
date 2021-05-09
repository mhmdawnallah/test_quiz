import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_quiz/enums/enums.dart';
import 'package:test_quiz/pages/home_screen.dart';
import 'package:test_quiz/utils/constants.dart';
import 'package:test_quiz/widgets/bordered_text.dart';
import 'package:test_quiz/widgets/classic_answer_container.dart';
import 'package:test_quiz/widgets/classic_question_app_bar.dart';
import 'package:test_quiz/widgets/error_dialog.dart';
import 'package:test_quiz/widgets/question_container.dart';

class ClassicQuestionScreen extends StatefulWidget {

  @override
  _ClassicQuestionScreenState createState() => _ClassicQuestionScreenState();
}

class _ClassicQuestionScreenState extends State<ClassicQuestionScreen>
    with TickerProviderStateMixin {
  late Animation<Offset> rightOrWrongAnimation;
  late AnimationController animationController;
  bool correctlyAnswered = false;
  bool answered = false;
  bool paused = false;
  bool showCorrect = false;
  int currentIndex = 0;
  int correctAnswers = 0;
  late Timer timer;
  int time = 100;
  int intervalTime = 2;
  void addCorrectAnswer() {

    setState(() {
      correctlyAnswered = true;
      correctAnswers += 1;
    });
  }

  void _answerQuestion(String answer) async {
    if (!showCorrect) {
      if (audioQuizDetails[currentIndex].correctAnswer ==
          answer) {
        addCorrectAnswer();
        setState(() {
          showCorrect = true;
          answered = true;
        });
        animationController.reset();
        await animationController.forward();
      } else {
        setState(() {
          correctlyAnswered = false;
          showCorrect = true;
          answered = true;
        });
        animationController.reset();
        await animationController.forward();
      }
    }
  }



  Future<bool> _handleBackPressed() {
    setState(() {
      paused = true;
    });
    var _time = time;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text(
          'If you stop the quiz and go back to main menu, you will lose the game.'

          ,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              setState(() {
                time = _time;
                paused = false;
              });
            },
            child: Text("No"),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.of(context).popUntil(
              ModalRoute.withName('/mainMenu'),
            ),
            child: Text("Yes"),
          ),
        ],
      ),
    ) as Future<bool>? ??
        false as Future<bool>;
  }

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    rightOrWrongAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.75))
            .animate(animationController);
    timer = Timer.periodic(
      Duration(seconds: 1),
          (Timer timer) {
        if (!paused) {
          if (!answered) {
            if (time == 0 && !correctlyAnswered) {
              _answerQuestion("");
            } else {
              setState(() {
                time = time - 1;
              });
            }
          } else if (intervalTime != 0) {
            setState(() {
              intervalTime = intervalTime - 1;
            });
          } else if (currentIndex <
              audioQuizDetails.length - 1 &&
              intervalTime == 0) {
            if (showCorrect) {
              if (correctlyAnswered) {
                Future.delayed(Duration(seconds: 5));
                setState(() {
                  showCorrect = false;
                  correctlyAnswered = false;
                  time = 15;
                  answered = false;
                  intervalTime = 2;
                  if (currentIndex <
                      audioQuizDetails.length - 1) {
                    currentIndex = currentIndex + 1;

                  }
                });
              }
            }
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed,
      child: Scaffold(
        body: Builder(builder: (context) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/new_classic_game_bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [

                    Expanded(
                      child: Container(),
                      flex: 2,
                    ),
                    QuestionContainer(
                      //TODO Media - QuizType Passing To Question Container
                      question:audioQuizDetails[currentIndex].question,
                      media: audioQuizDetails[currentIndex].media,
                      quizType: audioQuizDetails[currentIndex].quizType,
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Column(
                      children: [
                        ClassicAnswerContainer(
                          onPressed: _answerQuestion,
                          showCorrect: showCorrect,
                          answer: audioQuizDetails[currentIndex].answer1,
                          correctAnswer: audioQuizDetails[currentIndex].correctAnswer,
                        ),
                        ClassicAnswerContainer(

                          onPressed: _answerQuestion,
                          showCorrect: showCorrect,
                          answer: audioQuizDetails[currentIndex].answer2,
                          correctAnswer: audioQuizDetails[currentIndex].correctAnswer,
                        ),
                        ClassicAnswerContainer(
                          onPressed: _answerQuestion,
                          showCorrect: showCorrect,
                          answer: audioQuizDetails[currentIndex].answer3,
                          correctAnswer: audioQuizDetails[currentIndex].correctAnswer,
                        ),
                        ClassicAnswerContainer(
                          onPressed: _answerQuestion,
                          showCorrect: showCorrect,
                          answer: audioQuizDetails[currentIndex].answer4,
                          correctAnswer: audioQuizDetails[currentIndex].correctAnswer,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(),
                      flex: 3,
                    ),
                  ],
                ),
              ),
              if (showCorrect)
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return SlideTransition(
                      position: rightOrWrongAnimation,
                      child: Center(
                        child: BorderedText(
                          strokeColor:
                          correctlyAnswered ? Colors.green : Colors.red,
                          strokeWidth: 4,
                          child: Text(
                            correctlyAnswered ? "Correct!" : "Wrong!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "BalooThambi",
                              color: Color(0xffffffff),
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              else
                Container(),
            ],
          );
        }),
      ),
    );
  }
  void showErrorDialog({required BuildContext context, bool? exitsApp}) async {
    await showDialog(
      barrierDismissible: exitsApp != null && !exitsApp,
      context: context,
      builder: (context) => ErrorDialog(
        exitsApp: exitsApp,
        title: "Error",
        body:
        "An error occurred while connecting to our servers. Please try again shortly"
        ,
      ),
    );
  }
}
