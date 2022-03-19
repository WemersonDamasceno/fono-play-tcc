import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class CardInicialWidget extends StatelessWidget {
  final String imagePath;
  final String tituloCard;
  final String textoBotao;
  final Function() onPressed;

  const CardInicialWidget({
    Key? key,
    required this.imagePath,
    required this.tituloCard,
    required this.textoBotao,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        height: size.height * .22,
        width: size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            gradient: ConstantColor.linearColors),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: size.width * .45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    tituloCard,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      textoBotao,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
