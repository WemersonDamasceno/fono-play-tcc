import 'package:flutter/material.dart';
import '/src/constants/constants_colors.dart';

class ButtonGradienteWidget extends StatelessWidget {
  final String texto;
  final Function onPressed;
  const ButtonGradienteWidget({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 6,
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      child: Container(
        height: size.height * 0.07,
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          gradient: ConstantColor.linearColors,
        ),
        child: ElevatedButton(
          onPressed: () => onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
          ),
          child: Text(
            texto,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
