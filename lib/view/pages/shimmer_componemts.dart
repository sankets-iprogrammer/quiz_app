import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/view/components.dart';
import 'package:quiz_app/view/theme_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponents {
  static Widget getShimmerContainer({
    required double height,
    required double width,
    required Color baseColor,
    required Color highlightColor,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Shimmer.fromColors(
      period: Duration(seconds: 2),
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(7)
              : null,
          shape: shape,
          color: baseColor,
        ),
      ),
    );
  }

  static Widget getShimmerQuizContainer({
    required double height,
    required double width,
    required Color baseColor,
    required Color highlightColor,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: baseColor,
      ),
      child: Row(
        spacing: 20,
        children: [
          getShimmerContainer(
            height: height - 30,
            width: height - 30,
            baseColor: ThemeUtils.bgBlueColor,
            highlightColor: const Color.fromARGB(255, 223, 223, 224),
            shape: BoxShape.circle,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              getShimmerContainer(
                height: height / 4,
                width: 150,
                baseColor: ThemeUtils.bgBlueColor,
                highlightColor: const Color.fromARGB(255, 223, 223, 224),
              ),

              getShimmerContainer(
                height: height / 3,
                width: 200,
                baseColor: ThemeUtils.bgBlueColor,
                highlightColor: const Color.fromARGB(255, 223, 223, 224),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
