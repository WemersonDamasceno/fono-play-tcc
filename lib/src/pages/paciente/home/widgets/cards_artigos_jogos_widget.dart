import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class CardArtigosJogosWidget extends StatelessWidget {
  const CardArtigosJogosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                "assets/images/fono_explica.png",
                width: size.width * 0.3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "O que é apraxia?",
                    style: TextStyle(
                        color: ConstantColor.titlesColor, fontSize: 17),
                  ),
                  Text(
                    "DESCRIÇÃO",
                    style: TextStyle(
                      color: ConstantColor.descricaoColor,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "A apraxia de fala na infância \n(AFI) é um disturbio que \nafeta a produção motora de \nsons da fala.",
                    style: TextStyle(
                      color: ConstantColor.cinzaTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
