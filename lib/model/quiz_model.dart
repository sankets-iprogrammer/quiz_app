
import 'dart:convert';
import 'dart:developer';

import 'package:quiz_app/model/quiz_enum.dart';

class Quiz{
  Level difficultyLevel;
  int score=-1;
  int accuracy=-1;
  final List<QuizQuestion> questions;
  final String quizeName;
  String categoryID;
  int timeTaken=-1;
  DateTime? completedAt;
  Quiz({required this.quizeName ,required this.questions,required this.categoryID ,this.score=-1,this.timeTaken =-1,this.completedAt,this.accuracy=-1,required this.difficultyLevel});

  Map<String,dynamic> toJson(){
    return{
      "score":score,
      "questions": questions.map((question){return question.toJson();}).toList(),
      "quizeName":quizeName,
      "timeTaken":timeTaken,
      "categoryID":categoryID,
      "completedAt":completedAt.toString(),
      "accuracy":accuracy,
      "difficultyLevel":difficultyLevel.index
    };
  }
  factory Quiz.fromJson(Map<String,dynamic> json){
    log(json["completedAt"].runtimeType.toString());
    return Quiz(
      quizeName: json["quizeName"], 
      questions: (json["questions"] as List).map((question)=>QuizQuestion.fromJson(question)).toList(), 
      categoryID: json["categoryID"],
      score: json["score"],
      timeTaken: json["timeTaken"],
      completedAt:  json["completedAt"].toString()!="null"?DateTime.parse(json["completedAt"]):null ,
      accuracy:json["accuracy"],
      difficultyLevel: Level.values[json["difficultyLevel"]],
      );
  }
}

class QuizQuestion{
  final String question;
  final List options;
  final int answer;
  int selectedOption=-1;
  QuizQuestion({required this.question,required this.options,required this.answer,this.selectedOption=-1});

  Map<String,dynamic> toJson(){
    return{
      "question":question,
      "options":options,
      "answer":answer,
      "selectedOption":selectedOption
    };
  }

  factory QuizQuestion.fromJson(Map<String,dynamic> json){
    return QuizQuestion(
      question: json["question"],
       options: json["options"],
        answer: json["answer"],
        selectedOption:json["selectedOption"]);
  }

}

