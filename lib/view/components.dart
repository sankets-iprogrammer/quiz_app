import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/model/quiz_enum.dart';
import 'package:quiz_app/view/theme_utils.dart';

class UIComponents {
  static Container button(
    String text,
    Color bgColor,
    double fSize,
    Color fColor,
  ) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(color: fColor, fontSize: fSize),
      ),
    );
  }

  static Container difficultyLabel(Level level) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: getLevelColor(level),
      ),
      child: Text(level.name, style: ThemeUtils.b3Text),
    );
  }

  static Color getLevelColor(Level level){
    switch(level){
      case Level.easy:
        return ThemeUtils.bgEasy;
      case Level.medium:
        return ThemeUtils.bgMedium;
      case Level.hard:
        return ThemeUtils.bgHard;
    }
  }

  static Color getQuizStatusColor(int accuracy){
    switch(accuracy){
      case >80:
        return ThemeUtils.bgEasy;
      case >40:
        return ThemeUtils.bgMedium;
      case _:
        return ThemeUtils.bgHard;
    }
  }

  static Image getQuizStatusIcon(int accuracy){
    switch(accuracy){
      case >80:
        return Image.asset("assets/icons/trophy.png");
      case >40:
        return Image.asset("assets/icons/pass_quiz.png");
      case _:
        return Image.asset("assets/icons/cancel.png");
    }
  }


}
