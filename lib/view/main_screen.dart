import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/controller/state_controller.dart';
import 'package:quiz_app/view/appbar.dart';
import 'package:quiz_app/view/pages/home_screen.dart';
import 'package:quiz_app/view/pages/profile_screen.dart';
import 'package:quiz_app/view/pages/quiz_list.dart';
import 'package:quiz_app/view/pages/quiz_screen.dart';
import 'package:quiz_app/view/pages/splash_screen.dart';
import 'package:quiz_app/view/theme_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int currentPageIndex=StateController.currentPageIndex;
  List<Widget> screens =[];

void refreshHomeScreen(){
  log("main screen refreshed");
  log(StateController.currentPageIndex.toString());
  //  log(StateController.selectedQuizCategoryId.toString());
    setState(() {});
  }

  Widget getCurrentScreen() {
  switch (StateController.currentPageIndex){
    case 0:
      return HomeScreen(
        refreshHomeScreen: refreshHomeScreen,
      );

    case 1:
      return QuizListScreen(
        refreshHomeScreen: refreshHomeScreen,
        selectedQuizCategoryId:
            StateController.selectedQuizCategoryId,
      );

    case 2:
      return ProfileScreen();

    default:
      return HomeScreen(
        refreshHomeScreen: refreshHomeScreen,
      );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: StateController.currentPageIndex,
        indicatorColor: const Color.fromARGB(255, 166, 205, 249),
        onDestinationSelected: (int index) {
          setState(() {
            StateController.currentPageIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Image.asset("assets/icons/quiz.png", width: 20),
            label: 'Quizes',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Messages',
          ),
        ],
      ),
      body: getCurrentScreen(),
    );
  }
}
