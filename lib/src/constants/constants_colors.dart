import 'package:flutter/material.dart';

class ConstantColor {
  static const primaryColor = Color(0xFF378B69);
  static const secondaryColor = Color(0xFF1BA76D);
  static const startGradiente = Color(0xFF43725F);
  static const endGradiente = Color(0xFF0CC77A);
  static const titlesColor = Color(0xFF36455A);
  static const descricaoColor = Color(0xFF6A6F7D);
  static const linearColors = LinearGradient(
    colors: [
      ConstantColor.startGradiente,
      ConstantColor.endGradiente,
    ],
  );
}
