import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/controller/data_controller.dart';
import 'package:quiz_app/controller/state_controller.dart';
import 'package:quiz_app/model/category_model.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/view/appbar.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/pages/quiz_list.dart';
import 'package:quiz_app/view/pages/shimmer_componemts.dart';
import 'package:quiz_app/view/theme_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  final Function refreshHomeScreen;
  const HomeScreen({super.key,required this.refreshHomeScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, QuizCategory> categoriesMap = DataController.categories;
  List<QuizCategory> categoriesList = [];
  List<Quiz> quizes = [];
  bool dataLoader = true;
  bool showAllQuizHistory=false;
  void getStoredData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> savedQuizList = pref.getStringList('quizListString') ?? [];
    quizes = savedQuizList.map((quizeString) {
      return Quiz.fromJson(jsonDecode(quizeString));
    }).toList();
    dataLoader=false;
    log(quizes.toString());
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {});
    });
  }

  void toggleShowAllQuizHistory(){
    showAllQuizHistory=!showAllQuizHistory;
    setState((){});
  }

  String dateFormat(DateTime date) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(date);
  }

  @override
  void initState() {
    super.initState();
    categoriesList = categoriesMap.values.toList();
    getStoredData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.bgBlueColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: ThemeUtils.b2Text),
              Text("Hello, Sanket!", style: ThemeUtils.h2Text),
              dataLoader?ShimmerComponents.getShimmerContainer(
                height: 130,
                width: double.infinity,
                baseColor: ThemeUtils.secondaryBlueColor,
                highlightColor: const Color.fromARGB(255, 176, 202, 239),
              ):
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: ThemeUtils.secondaryBlueColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 5,
                      children: [
                        Image.asset("assets/icons/trophy.png"),
                        Text(quizes.length.toString(), style: ThemeUtils.h3Text),
                        Text("QUIZZES GIVEN", style: ThemeUtils.b2Text.copyWith(fontSize: 14)),
                      ],
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 204, 204, 225),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 5,
                      children: [
                        Image.asset("assets/icons/streak.png"),
                        Text("8 Days", style: ThemeUtils.h3Text),
                        Text("CURRENT STREAK", style: ThemeUtils.b2Text.copyWith(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: ThemeUtils.h3Text),
                  categoriesList.length>4?
                  GestureDetector(
                    child: Text("See all", style: ThemeUtils.h4Text)
                    ):Text(""),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:dataLoader?4: min(categoriesList.length,4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    if (dataLoader) {
                      return ShimmerComponents.getShimmerContainer(
                        height: 300,
                        width: 500,
                        baseColor: Colors.white,
                        highlightColor: const Color.fromARGB(
                          255,
                          228,
                          227,
                          227,
                        ),
                      );
                    }
                    QuizCategory quizCategory = categoriesList[index];

                    return GestureDetector(
                      onTap: () {
                        
                          StateController.currentPageIndex=1;
                          StateController.selectedQuizCategoryId=quizCategory.id;
                          widget.refreshHomeScreen();
                    
                      },
                      child: Container(
                        height: 300,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              quizCategory.name,
                              style: ThemeUtils.h3Text.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "${quizCategory.noOfQuize.toString()} Quizzes",
                              style: ThemeUtils.b2Text.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quiz History", style: ThemeUtils.h3Text),
                  quizes.length>5? GestureDetector(
                    onTap: (){
                      toggleShowAllQuizHistory();
                    },
                    child: Text(showAllQuizHistory?"Minimize":"View all", style: ThemeUtils.h4Text)
                    ):
                    Text(""),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: ListView.builder(
                  itemCount: dataLoader ? 4 : showAllQuizHistory ? quizes.length: min(quizes.length, 5),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (dataLoader) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ShimmerComponents.getShimmerQuizContainer(
                          baseColor: Colors.white,
                          height: 90,
                          width: double.infinity,
                          highlightColor: const Color.fromARGB(
                            255,
                            228,
                            227,
                            227,
                          ),
                        ),
                      );
                    } 
                      Quiz quiz = quizes[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: UIComponents.getQuizStatusColor(quiz.accuracy),
                                shape: BoxShape.circle
                              ),
                              child: UIComponents.getQuizStatusIcon(quiz.accuracy),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quiz.quizeName,
                                  style: ThemeUtils.b1Text.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  quiz.completedAt == null
                                      ? "Date Unavailable"
                                      : dateFormat(quiz.completedAt!),
                                  style: ThemeUtils.b2Text.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "${quiz.score}/${quiz.questions.length}",
                                  style: ThemeUtils.b1Text,
                                ),
                                Text(
                                  "SCORE",
                                  style: ThemeUtils.b2Text.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                  },
                ),
              ),
              !dataLoader && quizes.isNotEmpty?Text(""):
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 50),
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeUtils.bgEasy
                      ),
                      padding: EdgeInsets.all(20),
                      child: Image.asset("assets/icons/question_l.png",fit: BoxFit.cover,),
                    ),
                    Text("No Quizzes Yet",style: ThemeUtils.h3Text,),
                    Text("Complete your first quiz to see your performance history here.",style: ThemeUtils.b2Text.copyWith(fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizListScreen(selectedQuizCategoryId: null,refreshHomeScreen: widget.refreshHomeScreen,)));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        decoration: BoxDecoration(
                          color: ThemeUtils.primaryBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text("Start a Quiz",style: TextStyle(fontSize: 16,color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
