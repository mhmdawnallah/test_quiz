import 'dart:convert';

import 'package:flutter/foundation.dart';

class GameSessionModel {
  String? seasonID;
  List<QuizDetail>? quizDetail;
  GameSessionModel({
    this.seasonID,
    this.quizDetail,
  });

  GameSessionModel copyWith({
    String? seasonID,
    List<QuizDetail>? quizDetail,
  }) {
    return GameSessionModel(
      seasonID:   this.seasonID,
      quizDetail:   this.quizDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seasonID': seasonID,
      'quizDetail': quizDetail?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory GameSessionModel.fromJson(String source) =>
      GameSessionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'GameSessionModel(seasonID: $seasonID, quizDetail: $quizDetail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameSessionModel &&
        other.seasonID == seasonID &&
        listEquals(other.quizDetail, quizDetail);
  }

  @override
  int get hashCode => seasonID.hashCode ^ quizDetail.hashCode;

  factory GameSessionModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return GameSessionModel(
      seasonID: map['seasonID'],
      quizDetail: List<QuizDetail>.from(
          map['quizDetail'].map((x) => QuizDetail.fromMap(x))),
    );
  }
}

class QuizDetail {
  String? quizID;
  String? question;
  String? noOfChoice;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? correctAnswer;
  //TODO Adding Two Args QuizType + Media
  String? quizType;
  String? media;
  QuizDetail({
    this.quizID,
    this.question,
    this.noOfChoice,
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.correctAnswer,
    this.quizType,
    this.media,
  });

  QuizDetail copyWith({
    String? quizID,
    String? question,
    String? noOfChoice,
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
    String? correctAnswer,
  }) {
    return QuizDetail(
      quizID:   this.quizID,
      question:   this.question,
      noOfChoice:   this.noOfChoice,
      answer1:   this.answer1,
      answer2:   this.answer2,
      answer3:   this.answer3,
      answer4:   this.answer4,
      correctAnswer:   this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quizID': quizID,
      'question': question,
      'noOfChoice': noOfChoice,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'correctAnswer': correctAnswer,

      "quizType":quizType,
      "media":media,
    };
  }

  String toJson() => json.encode(toMap());

  factory QuizDetail.fromJson(String source) =>
      QuizDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizDetail(quizID: $quizID, question: $question, noOfChoice: $noOfChoice, answer1: $answer1, answer2: $answer2, answer3: $answer3, answer4: $answer4, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizDetail &&
        other.quizID == quizID &&
        other.question == question &&
        other.noOfChoice == noOfChoice &&
        other.answer1 == answer1 &&
        other.answer2 == answer2 &&
        other.answer3 == answer3 &&
        other.answer4 == answer4 &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode {
    return quizID.hashCode ^
    question.hashCode ^
    noOfChoice.hashCode ^
    answer1.hashCode ^
    answer2.hashCode ^
    answer3.hashCode ^
    answer4.hashCode ^
    correctAnswer.hashCode;
  }

  factory QuizDetail.fromMap(Map<String, dynamic> map) {
    return QuizDetail(
      quizID: map['quizID'],
      question: map['question'],
      noOfChoice: map['noOfChoice'],
      answer1: map['answer1'],
      answer2: map['answer2'],
      answer3: map['answer3'],
      answer4: map['answer4'],
      correctAnswer: map['correctAnswer'],
      quizType: map["quizType"],
      media:map['media'],
    );
  }
}
