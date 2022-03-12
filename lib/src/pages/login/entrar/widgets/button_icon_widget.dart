import 'package:flutter/material.dart';
import '/src/constants/constants_colors.dart';

class ButtonIconWidget extends StatelessWidget {
  final String pathImagem;
  final String texto;
  const ButtonIconWidget({
    Key? key,
    required this.pathImagem,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: ConstantColor.primaryColor,
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {},
        icon: Image.asset(
          pathImagem,
          width: size.width * 0.1,
        ),
        label: Text(texto),
      ),
    );
  }
}
