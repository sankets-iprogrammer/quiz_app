import 'dart:convert';
import 'dart:developer';

import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/controller/state_controller.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/pages/home_screen.dart';
import 'package:quiz_app/view/pages/quiz_screen.dart';
import 'package:quiz_app/view/theme_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerformanceScreen extends StatefulWidget {
  final Function refreshHomeScreen;
  final Quiz quiz;
  const PerformanceScreen({super.key,required this.quiz,required this.refreshHomeScreen});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}
class Tag{
  final String title;
  final String desc;
  Tag({required this.title,required this.desc});
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  int score=0;
  int accuracy=0;
  Tag tag=Tag(title: "", desc: "");
  int timeTaken=0;
  int totalQuestions=0;

  Tag setTag(int accuracy){
    switch(accuracy){
      case >80:
        return Tag(title: "Excellent Performance!", desc: "You've mastered this set. Your knowledge of the subject is truly impressive.");
      case >60:
        return Tag(title: "Good Job!", desc: "You’ve demonstrated a strong understanding of the topic with only a few minor gaps to improve.");
      case >40:
        return Tag(title: "Nice Effort!", desc: "You have a fair grasp of the concepts. Keep practicing to strengthen your understanding further.");
      case >20:
        return Tag(title: "Keep Practicing!", desc: "You’re making progress, but some important concepts still need more attention and revision.");
      case _:
        return Tag(title: "Needs Improvement", desc: "More practice and focus on the fundamentals will help you build a better understanding of the subject.");
    }
  }

  void calculateScore(){
    widget.quiz.questions.forEach((question){
      if(question.answer==question.selectedOption){
        score++;
      }
    });
    accuracy=(score/widget.quiz.questions.length*100).toInt();
    timeTaken=widget.quiz.timeTaken;
    totalQuestions=widget.quiz.questions.length;
    tag=setTag(accuracy);
    widget.quiz.score=score;
    widget.quiz.accuracy=accuracy;
  }
  void saveScore()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    List<String>? savedQuizList=  pref.getStringList('quizListString')??[];
    if(savedQuizList.isNotEmpty){
      log(savedQuizList.toString());
    }else{
      log("no data");
    }
    savedQuizList.add(jsonEncode(widget.quiz.toJson()));
    await pref.setStringList("quizListString", savedQuizList);
  }

  @override
  void initState(){
    calculateScore();
    saveScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.bgBlueColor,
      appBar: AppBar(
        elevation: 1,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            Image.asset("assets/logo_q.png",width: 50,),
            Text("QuizMaster",
        style: ThemeUtils.h2Text
        ),
          ],
        )
      ),
      body: Container(
        padding: EdgeInsetsGeometry.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 180,
                  height: 180,
                  child: Stack(
                        children: [
                          SingleSimpleStackCircularProgressBar(
                            size: 180,
                            backStrokeWidth: 15,
                            progressStrokeWidth: 15,
                            backColor: ThemeUtils.secondaryBlueColor,
                            barColor: ThemeUtils.primaryBlueColor,
                            barValue: accuracy.toDouble(),
                            isTextShow: false,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                Text("$score/$totalQuestions",
                                style:ThemeUtils.h1Text.copyWith(
                                  color: ThemeUtils.primaryBlueColor
                                ),
                                ),
                                Text("SCORE",style: ThemeUtils.b2Text,),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
                Text(tag.title,
                style: ThemeUtils.h2Text.copyWith(
                  color: ThemeUtils.textDarkBlueColor
                )
                ),
                Text(tag.desc,
                style: ThemeUtils.b2Text,
                textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              spacing: 20,
              children: [
                Expanded( 
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      spacing: 10,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeUtils.secondaryBlueColor,
                            ),
                            child: Icon(Icons.alarm_rounded,
                            color: ThemeUtils.primaryBlueColor,),
                          ),
                          Text("Time",
                          style: ThemeUtils.b2Text,
                          ),
                          Text("${timeTaken~/60}:${timeTaken%60}",
                          style: ThemeUtils.h3Text,
                          ),
                        ],
                    ),
                  ),
                ),
                Expanded( 
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      spacing: 10,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeUtils.secondaryBlueColor,
                            ),
                            child: Icon(Icons.electric_bolt_outlined,
                            color: ThemeUtils.primaryBlueColor,),
                          ),
                          Text("Accuracy",
                          style: ThemeUtils.b2Text,
                          ),
                          Text("$accuracy%",
                          style: ThemeUtils.h3Text,
                          ),
                        ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color(0xFFFFDDB8)
                  ,Color(0xFFFFB95F)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("assets/space.png"),
                  ),
                  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      
                      children: [
                        Text("NEW ACHIEVEMENT",style: ThemeUtils.b2Text,),
                        Text("Speed Demon",style: ThemeUtils.h3Text,),
                        Text("Finished the quiz in record time!",style: ThemeUtils.b1Text,textAlign: TextAlign.center,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>QuizScreen(quiz: widget.quiz,refreshHomeScreen: widget.refreshHomeScreen,)));
              },
              child: UIComponents.button("Play Again", ThemeUtils.primaryBlueColor, 23, Colors.white)),
            GestureDetector(
              onTap: () {
                StateController.currentPageIndex=0;
                widget.refreshHomeScreen();
                Navigator.of(context).pop();
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: UIComponents.button("Back to Home", ThemeUtils.secondaryBlueColor, 23, ThemeUtils.primaryBlueColor)),
          ],
        ),
      ),
    );
  }
}