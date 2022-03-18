import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class CardArtigosJogosWidget extends StatelessWidget {
  final String pathImage;
  final String titulo;
  final String descricao;
  const CardArtigosJogosWidget({
    Key? key,
    required this.pathImage,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

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
                pathImage,
                width: size.width * 0.3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ConstantColor.titlesColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Descrição",
                    style: TextStyle(
                      color: ConstantColor.descricaoColor,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    descricao,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
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
