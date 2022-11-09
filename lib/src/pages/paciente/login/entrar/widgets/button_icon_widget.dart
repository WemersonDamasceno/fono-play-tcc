import 'package:flutter/material.dart';

import '/src/constants/constants_colors.dart';

class ButtonIconWidget extends StatelessWidget {
  final String pathImagem;
  final String texto;
  final Function() onPressed;
  const ButtonIconWidget({
    Key? key,
    required this.pathImagem,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: ConstantColor.primaryColor,
          backgroundColor: Colors.white,
          alignment: Alignment.centerLeft,
        ),
        onPressed: onPressed,
        icon: Image.asset(
          pathImagem,
          width: size.width * 0.1,
        ),
        label: Text(texto),
      ),
    );
  }
}
