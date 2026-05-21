import 'package:flutter/material.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/main_screen.dart';
import 'package:quiz_app/view/pages/home_screen.dart';
import 'package:quiz_app/view/pages/quiz_screen.dart';
import 'package:quiz_app/view/theme_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ThemeUtils.bgBlueColor,
          image: DecorationImage(
            image: AssetImage('assets/bg_splash.png'),
            fit: BoxFit.fill
          )
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(tag: "logo", child:Image.asset("assets/logo_q.png") ),
                    Text("QuizMaster",
                    style: ThemeUtils.h1Text,
                    ),
                    Text("Elevate your knowledge through intelligent, energetic learning.",
                    textAlign: TextAlign.center,
                    style: ThemeUtils.b1Text,
                    )
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                },
                child: UIComponents.button("Get Started",ThemeUtils.primaryBlueColor, 20, Colors.white),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("POWERED BY ENERGETIC INTELLIGENCE",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF727785),
                
                ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}