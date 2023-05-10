import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF378B69);
  static const secondaryColor = Color(0xFF1BA76D);
  static const cinzaColor = Color(0xFFB1B1B1);
  static const cinzaTextColor = Color(0xFF777777);
  static const startGradiente = Color(0xFF43725F);
  static const endGradiente = Color(0xFF1BA76D);
  static const titlesColor = Color(0xFF36455A);
  static const descricaoColor = Color(0xFF6A6F7D);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const linearColors = LinearGradient(
    colors: [
      AppColors.startGradiente,
      AppColors.endGradiente,
    ],
  );
}
