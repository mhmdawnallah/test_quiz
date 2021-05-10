import 'package:test_quiz/models/game_sessions_model.dart';
import 'package:test_quiz/utils/constants.dart';

class QuestionFunctions {

  // it is used to check the right answer
  checkAnswer(String answer) {
    for (int i = 0; i < audioQuizDetails.length; i++) {
      if (answer == audioQuizDetails[i].correctAnswer) {
        return audioQuizDetails[i];
      }
      return false;
    }
  }

  // it is used to get the first question details in the list to show by default on the screen
  QuizDetail getFirstQuestion() {
    print(audioQuizDetails[0].answer1);
    return audioQuizDetails[0];
  }
}
