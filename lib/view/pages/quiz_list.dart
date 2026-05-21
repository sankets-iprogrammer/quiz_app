import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quiz_app/controller/data_controller.dart';
import 'package:quiz_app/model/category_model.dart';
import 'package:quiz_app/model/quiz_enum.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/view/appbar.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/pages/quiz_screen.dart';
import 'package:quiz_app/view/theme_utils.dart';

class QuizListScreen extends StatefulWidget {
  final String? selectedQuizCategoryId;
  final Function refreshHomeScreen;
  const QuizListScreen({super.key,required this.selectedQuizCategoryId,required this.refreshHomeScreen});
  
  @override
  State<QuizListScreen> createState() => __QuizListScreenState();
}

class __QuizListScreenState extends State<QuizListScreen> {
List<Quiz> quizes =DataController.quizes;
List<Quiz> filteredQuizes=[];
Map<String,QuizCategory> quizCategoryMap =DataController.categories;
List<QuizCategory> quizCategoryList=[];
String? selectedQuizCategoryId;

void openDialogBox(Quiz quiz)async{
    bool? result =await showDialog(context: context,
     builder: (context){
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Are you ready to start this quiz?",style: ThemeUtils.h2Text.copyWith(fontSize: 24),textAlign: TextAlign.center,),
              Text("You can review your results once you finish.",style: ThemeUtils.b1Text.copyWith(fontSize: 18  ),textAlign: TextAlign.center),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, true);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top:20),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ThemeUtils.primaryBlueColor,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("Start Quiz",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context, false);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ThemeUtils.secondaryBlueColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFFC2C6D6)
                    )
                  ),
                  child: Text("Cancel",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                ),
              )
            ],
          ),
        ),
      );
     });

     if(result!=null &&result){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizScreen(quiz: quiz,refreshHomeScreen: widget.refreshHomeScreen,)));
     }
}

@override
  void initState() {
    super.initState();

    selectedQuizCategoryId=widget.selectedQuizCategoryId;
    quizCategoryList = quizCategoryMap.values.toList();
    filterQuizes(selectedQuizCategoryId);

  }

  void filterQuizes(String? quizCategoryId){
    log("filter category for $quizCategoryId");
    selectedQuizCategoryId=quizCategoryId;
    if(quizCategoryId!=null){
      filteredQuizes=quizes.where((quiz)=>quiz.categoryID==quizCategoryId).toList();
    }else{
      filteredQuizes=quizes;
    }
    setState((){});
  }

  void searchQuizes(String searchKey){
    filteredQuizes=quizes.where((quiz)=>quiz.quizeName.toLowerCase().contains(searchKey.trim().toLowerCase())).toList();
    setState((){});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.bgBlueColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 35,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: quizCategoryList.length+1,
                        itemBuilder: (context,index){
                          QuizCategory? quizCategory=index!=0?quizCategoryList[index-1]:null;
                          return GestureDetector(
                            onTap: (){
                              log("category cahnged");
                              filterQuizes(quizCategory?.id);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:selectedQuizCategoryId==null && index==0?ThemeUtils.primaryBlueColor:index!=0 && selectedQuizCategoryId==quizCategory!.id? ThemeUtils.primaryBlueColor: ThemeUtils.secondaryBlueColor,
                              ),
                              child: Text(index==0?"All":quizCategory!.name,style: ThemeUtils.h4Text.copyWith(
                                color: selectedQuizCategoryId==null && index==0?const Color.fromARGB(255, 255, 255, 255): index!=0 && selectedQuizCategoryId==quizCategory!.id? const Color.fromARGB(255, 255, 255, 255): const Color.fromARGB(255, 86, 86, 86),
                                ),
                            )),
                          );
                        })
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,top: 30),
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ThemeUtils.secondaryBlueColor,
          
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        onChanged: (value)=>searchQuizes(value),
                        decoration: InputDecoration(
                          hintText: "Search for quizzes...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                        ),
                      ),
                    ),
                  ],
                )
              ),

              filteredQuizes.isNotEmpty?
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredQuizes.length,
                itemBuilder: (context,index){
                  Quiz quiz=filteredQuizes[index];
                  return GestureDetector(
                    onTap: () {
                      openDialogBox(quiz);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuizScreen(quiz: quiz)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(DataController.getCategoryName(quiz.categoryID) ,style: ThemeUtils.b2Text.copyWith(fontSize: 12),),
                                  Text(quiz.quizeName,style: ThemeUtils.b1Text,),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/icons/question.png"),
                                        SizedBox(width: 5,),
                                        Text("${quiz.questions.length} Questions"),
                                        SizedBox(width: 10,),
                                        Image.asset("assets/icons/time.png"),
                                        SizedBox(width: 5,),
                                        Text("15 Min"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Icon(Icons.chevron_right,color: ThemeUtils.primaryBlueColor,)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: UIComponents.difficultyLabel(quiz.difficultyLevel))
                      ],
                    ),
                  );
              }):
               Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,bottom: 50,top: 70),
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
                    Text("There are currently no quizzes available in this category/search. Check back later or explore other topics.",style: ThemeUtils.b2Text.copyWith(fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    
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