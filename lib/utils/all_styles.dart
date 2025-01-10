
import 'package:flutter/material.dart';
import 'package:hive_learning/utils/all_colors.dart';
import 'package:hive_learning/utils/all_sizes.dart';



class AllStyles {
  static final headingStyle = TextStyle(
    fontSize: AllSizes.extraLarge,
    fontWeight: FontWeight.bold,
    color: AllColors.whiteColor,
  );
  static final titleStyle = TextStyle(
    fontSize: AllSizes.large,
    fontWeight: FontWeight.normal,
    color: AllColors.blackColor,
  );
  static final subtitleStyle = TextStyle(
    fontSize: AllSizes.medium,
    fontWeight: FontWeight.normal,
    color: AllColors.greyColor,
  );
}
