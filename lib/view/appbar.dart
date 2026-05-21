import 'package:flutter/material.dart';
import 'package:quiz_app/view/theme_utils.dart';

AppBar getAppbar(){
  return AppBar(
        elevation: 1,
        title: Row(
          children: [
            Hero(
              tag: "logo",
              child: Image.asset("assets/logo_q.png",width: 50,)),
            Text("QuizMaster",
        style: ThemeUtils.h2Text
        ),
          ],
        )
      );
}