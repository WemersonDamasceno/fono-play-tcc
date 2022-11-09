import 'package:flutter/material.dart';

import '/src/constants/constants_colors.dart';

class ButtonGradienteWidget extends StatelessWidget {
  final String texto;
  final Function() onPressed;
  final bool habilitarBotao;
  const ButtonGradienteWidget({
    Key? key,
    required this.texto,
    required this.onPressed,
    required this.habilitarBotao,
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
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: habilitarBotao
              ? Text(
                  texto,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 6, right: 10),
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    Text(
                      "Carregando...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
