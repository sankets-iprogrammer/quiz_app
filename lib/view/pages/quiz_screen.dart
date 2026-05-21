import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/view/appbar.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/pages/performance_screen.dart';
import 'package:quiz_app/view/theme_utils.dart';
import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class QuizScreen extends StatefulWidget {
  final Function refreshHomeScreen;
  final Quiz quiz;
  const QuizScreen({super.key,required this.quiz,required this.refreshHomeScreen});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {


  int currentQuestion = 0;
  int selectedOption = -1;
  int totalTime = 15;
  int? timeLeft;
  Timer? timer;
  int timeTaken = 0;

  void changeQuestion() {
    timer?.cancel();
    if (currentQuestion >= widget.quiz.questions.length - 1) {
      widget.quiz.timeTaken = timeTaken;
      widget.quiz.completedAt =DateTime.now();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PerformanceScreen(quiz: widget.quiz,refreshHomeScreen: widget.refreshHomeScreen,)),
      );
    } else {
      setState(() {
        currentQuestion++;
        setTimer();
      });
    }
  }

  void submitAnswer() {
    widget.quiz.questions[currentQuestion].selectedOption = selectedOption;
    selectedOption = -1;
    changeQuestion();
  }

  void setTimer() {
    timeLeft = totalTime;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft != null) {
        timeTaken++;
        setState(() {
          timeLeft = timeLeft! - 1;
          if (timeLeft! <= 0) {
            timer.cancel();
            submitAnswer();
          }
        });
      }
    });
  }

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.bgBlueColor,
      appBar: getAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.quiz.quizeName, style: ThemeUtils.h2Text),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Questions", style: ThemeUtils.b2Text),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: (currentQuestion+1).toString(),
                                style: ThemeUtils.h1Text.copyWith(
                                  color: ThemeUtils.primaryBlueColor,
                                ),
                              ),
                              TextSpan(
                                text: "/${widget.quiz.questions.length}",
                                style: ThemeUtils.h3Text.copyWith(
                                  color: ThemeUtils.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        SimpleStackCircularProgressBar(
                          size: 70,
                          backStrokeWidth: 7,
                          progressStrokeWidth: 7,
                          backColor: ThemeUtils.secondaryBlueColor,
                          bars: [
                            SimpleBarValue(
                              barColor: ThemeUtils.primaryBlueColor,
                              barValues: ((timeLeft ?? 0) / totalTime) * 100,
                              fullProgressColors: Colors.green,
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            height: 70,
                            width: 70,
                            alignment: Alignment.center,
                            child: Text(
                              "${(timeLeft ?? 0) ~/ 60}:${(timeLeft ?? 0) % 60}",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LinearProgressBar(
                    animateProgress: true,
                    progressColor: ThemeUtils.primaryBlueColor,
                    maxSteps: 100,
                    currentStep: (currentQuestion / widget.quiz.questions.length * 100)
                        .toInt(),
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    backgroundColor: ThemeUtils.secondaryBlueColor,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(225, 233, 253, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Q) ${widget.quiz.questions[currentQuestion].question}',
                    style: ThemeUtils.b1Text,
                  ),
                ),
                for (
                  int i = 0;
                  i < widget.quiz.questions[currentQuestion].options.length;
                  i++
                )
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                      decoration: BoxDecoration(
                        color: i == selectedOption
                            ? ThemeUtils.secondaryBlueColor
                            : Colors.white,
                        border: Border.all(color: ThemeUtils.greyColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == selectedOption
                                  ? ThemeUtils.primaryBlueColor
                                  : ThemeUtils.secondaryBlueColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              String.fromCharCode(65 + i),
                              style: ThemeUtils.b2Text.copyWith(
                                color: i == selectedOption
                                    ? Colors.white
                                    : ThemeUtils.textDarkBlueColor,
                              ),
                            ),
                          ),
                          Text(
                            widget.quiz.questions[currentQuestion].options[i],
                            style: ThemeUtils.b1Text,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            GestureDetector(
              onTap: () {
                submitAnswer();
              },
              child: UIComponents.button(
                "Next",
                ThemeUtils.primaryBlueColor,
                20,
                Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
