import 'package:flutter/material.dart';
import 'package:test_quiz/enums/enums.dart';

import 'bordered_text.dart';

class ClassicQuestionAppBar extends StatelessWidget {

  final int time=60;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/new_classic_game_header.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(
            getIconPath(QuizCategory.Art),
            height: 30,
            width: 30,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: BorderedText(
                strokeColor: Color(0xff0057a9),
                strokeWidth: 4,
                child: Text(
                  QuizCategory.Art.toString().substring(13),
                  style: TextStyle(
                    fontFamily: "BalooThambi",
                    color: Color(0xffffffff),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            child: BorderedText(
              strokeColor: Color(0xff0057a9),
              strokeWidth: 4,
              child: Text(
                "$time",
                style: TextStyle(
                  fontFamily: "BalooThambi",
                  color: Color(0xffffffff),
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  String getIconPath(QuizCategory quizCategory) {
    switch (quizCategory) {
      case QuizCategory.Art:
        return "assets/images/art_appbar_icon.png";
      case QuizCategory.Science:
        return "assets/images/science_appbar_icon.png";
      case QuizCategory.Crown:
        return "assets/images/history_appbar_icon.png";
      case QuizCategory.Geography:
        return "assets/images/geography_appbar_icon.png";
      case QuizCategory.Entertainment:
        return "assets/images/entertainment_appbar_icon.png";
      case QuizCategory.History:
        return "assets/images/history_appbar_icon.png";
      case QuizCategory.Sport:
        return "assets/images/sport_appbar_icon.png";
      default:
        return "assets/images/history_appbar_icon.png";
    }
  }
}
