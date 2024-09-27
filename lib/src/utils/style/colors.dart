import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  // Preventing instantiation
  AppColors._();

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color black_900 = Color(0xFF1A1A1A);
  static const Color black_800 = Color(0xFF333333);
  static const Color black_700 = Color(0xFF4D4D4D);
  static const Color black_600 = Color(0xFF666666);
  static const Color black_500 = Color(0xFF808080);
  static const Color black_400 = Color(0xFF999999);
  static const Color black_300 = Color(0xFFB3B3B3);
  static const Color black_200 = Color(0xFFCCCCCC);
  static const Color black_100 = Color(0xFFE5E5E5);
  static const Color white = Color(0xFFFFFFFF);

  // Primary Colors
  static const Color primarySource = Color(0xFF024449);
  static const Color primary_900 = Color(0xFF1B575B);
  static const Color primary_800 = Color(0xFF35696D);
  static const Color primary_700 = Color(0xFF4E7C80);
  static const Color primary_600 = Color(0xFF678F92);
  static const Color primary_500 = Color(0xFF80A1A4);
  static const Color primary_400 = Color(0xFF9AB4B6);
  static const Color primary_300 = Color(0xFFB3C7C8);
  static const Color primary_200 = Color(0xFFCCDADB);
  static const Color primary_100 = Color(0xFFE6ECED);

  // Secondary Colors
  static const Color secondarySource = Color(0xFFC68E47);
  static const Color secondary_900 = Color(0xFFCC9959);
  static const Color secondary_800 = Color(0xFFD1A56C);
  static const Color secondary_700 = Color(0xFFD7B07E);
  static const Color secondary_600 = Color(0xFFDDBB91);
  static const Color secondary_500 = Color(0xFFE3C7A3);
  static const Color secondary_400 = Color(0xFFE8D2B5);
  static const Color secondary_300 = Color(0xFFEEDDC8);
  static const Color secondary_200 = Color(0xFFF4E8DA);
  static const Color secondary_100 = Color(0xFFF9F4ED);

  // Blue Colors
  static const Color blueSource = Color(0xFF0000A0);
  static const Color blue_900 = Color(0xFF1A1AA9);
  static const Color blue_800 = Color(0xFF3333B3);
  static const Color blue_700 = Color(0xFF4D4DBD);
  static const Color blue_600 = Color(0xFF6666C6);
  static const Color blue_500 = Color(0xFF8080CF);
  static const Color blue_400 = Color(0xFF9999D9);
  static const Color blue_300 = Color(0xFFB2B2E2);
  static const Color blue_200 = Color(0xFFCCCCEC);
  static const Color blue_100 = Color(0xFFE5E5F5);

  // Sky Blue Colors
  static const Color skyBlueSource = Color(0xFF1C96C5);
  static const Color skyBlue_900 = Color(0xFF33A0CB);
  static const Color skyBlue_800 = Color(0xFF49ABD1);
  static const Color skyBlue_700 = Color(0xFF60B6D6);
  static const Color skyBlue_600 = Color(0xFF77C0DC);
  static const Color skyBlue_500 = Color(0xFF8DCBE2);
  static const Color skyBlue_400 = Color(0xFFA4D5E8);
  static const Color skyBlue_300 = Color(0xFFBBDFEE);
  static const Color skyBlue_200 = Color(0xFFD2EAF3);
  static const Color skyBlue_100 = Color(0xFFE8F4F9);

  // Red Colors
  static const Color redSource = Color(0xFFE10E0E);
  static const Color red_900 = Color(0xFFE42626);
  static const Color red_800 = Color(0xFFE73E3E);
  static const Color red_700 = Color(0xFFEA5656);
  static const Color red_600 = Color(0xFFED6E6E);
  static const Color red_500 = Color(0xFFF08686);
  static const Color red_400 = Color(0xFFF39F9F);
  static const Color red_300 = Color(0xFFF6B7B7);
  static const Color red_200 = Color(0xFFF9CFCF);
  static const Color red_100 = Color(0xFFFCE7E7);

  // Green Colors
  static const Color greenSource = Color(0xFF009900);
  static const Color green_900 = Color(0xFF1AA31A);
  static const Color green_800 = Color(0xFF33AD33);
  static const Color green_700 = Color(0xFF4DB84D);
  static const Color green_600 = Color(0xFF66C266);
  static const Color green_500 = Color(0xFF80CC80);
  static const Color green_400 = Color(0xFF99D699);
  static const Color green_300 = Color(0xFFB2E0B2);
  static const Color green_200 = Color(0xFFCCEBCC);
  static const Color green_100 = Color(0xFFE5F5E5);

  // Yellow Colors
  static const Color yellowSource = Color(0xFFFFBB00);
  static const Color yellow_900 = Color(0xFFFFC21A);
  static const Color yellow_800 = Color(0xFFFFC933);
  static const Color yellow_700 = Color(0xFFFFCF4D);
  static const Color yellow_600 = Color(0xFFFFD666);
  static const Color yellow_500 = Color(0xFFFFDD80);
  static const Color yellow_400 = Color(0xFFFFE499);
  static const Color yellow_300 = Color(0xFFFFEBB2);
  static const Color yellow_200 = Color(0xFFFFF1CC);
  static const Color yellow_100 = Color(0xFFFFF8E5);

  // Orange Colors
  static const Color orangeSource = Color(0xFFFFA500);
  static const Color orange_900 = Color(0xFFFFAE1A);
  static const Color orange_800 = Color(0xFFFFB733);
  static const Color orange_700 = Color(0xFFFFC04D);
  static const Color orange_600 = Color(0xFFFFC966);
  static const Color orange_500 = Color(0xFFFFD280);
  static const Color orange_400 = Color(0xFFFFDB99);
  static const Color orange_300 = Color(0xFFFFE4B2);
  static const Color orange_200 = Color(0xFFFFEDCC);
  static const Color orange_100 = Color(0xFFFFF6E5);
}

Color getRandomColor() {
  List<Color> colorOptions = [
    AppColors.primarySource,
    AppColors.secondarySource,
    AppColors.greenSource,
    AppColors.blueSource,
    AppColors.redSource,
    AppColors.yellowSource,
    AppColors.orangeSource,
    AppColors.skyBlueSource,
    AppColors.red_900,
    AppColors.green_900,
    AppColors.blue_900,
  ];

  return colorOptions[Random().nextInt(colorOptions.length)];
}
