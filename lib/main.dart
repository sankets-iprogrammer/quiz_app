import 'package:flutter/material.dart';
import 'package:quiz_app/view/main_screen.dart';
import 'package:quiz_app/view/pages/home_screen.dart';
import 'package:quiz_app/view/pages/performance_screen.dart';
import 'package:quiz_app/view/pages/quiz_list.dart';
import 'package:quiz_app/view/pages/quiz_screen.dart';
import 'package:quiz_app/view/pages/splash_screen.dart';

void main(){
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
