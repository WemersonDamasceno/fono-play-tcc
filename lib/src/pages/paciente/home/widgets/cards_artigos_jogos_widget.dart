import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constant_identificadores.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class CardArtigosJogosWidget extends StatelessWidget {
  final String pathImage;
  final String titulo;
  final String descricao;
  final String id;
  const CardArtigosJogosWidget({
    Key? key,
    required this.pathImage,
    required this.titulo,
    required this.descricao,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            switch (id) {
              case ConstantesIdentificadores.JOGO_DA_MEMORIA:
                Navigator.pushNamed(context, "/jogo_da_memoria");
                break;
              case ConstantesIdentificadores.JOGO_CONSEGUE_IMITAR:
                Navigator.pushNamed(context, "/jogo_da_imitacao");
                break;
              case ConstantesIdentificadores.JOGO_BRINCANDO_COM_LINGUA:
                break;
            }
          },
          child: Row(
            children: [
              Image.asset(
                pathImage,
                width: size.width * 0.3,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.titlesColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Descrição",
                    style: TextStyle(
                      color: AppColors.descricaoColor,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    descricao,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.cinzaTextColor,
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
