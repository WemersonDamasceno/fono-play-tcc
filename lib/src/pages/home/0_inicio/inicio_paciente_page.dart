import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

import 'widgets/card/card_inicial_widget.dart';

class InicioPacientePage extends StatefulWidget {
  const InicioPacientePage({Key? key}) : super(key: key);

  @override
  State<InicioPacientePage> createState() => _InicioPacientePageState();
}

class _InicioPacientePageState extends State<InicioPacientePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ContainerGradienteWidget(),
        SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
            child: const CabecalhoWidget(
              isGame: false,
              imagemPerfil: "assets/images/avatar_01.png",
              nomeCrianca: "Joãozinho",
              titulo: "",
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.17,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: size.height * 0.16,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Escolha um jogo",
                        style: TextStyle(
                          color: AppColors.titlesColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "Chame seu filho(a) e \nbrinque com ele.",
                          style: TextStyle(color: AppColors.descricaoColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.12,
          right: 0,
          left: size.width * 0.57,
          child: Image.asset(
            "assets/images/brincando_com_a_lingua.png",
            width: size.width * 0.45,
          ),
        ),
        Positioned(
          top: size.height * .36,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  child: CardInicialWidget(
                    imagePath: "assets/images/astronauto.gif",
                    onPressed: () => homeController
                        .trocarTela(ConstantesPaginas.LISTA_JOGOS),
                    textoBotao: "Jogar",
                    tituloCard: "Meus jogos",
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: CardInicialWidget(
                    imagePath: "assets/images/menina_alto.gif",
                    onPressed: () =>
                        Navigator.pushNamed(context, "/toque-para-falar"),
                    textoBotao: "Abrir",
                    tituloCard: "Toque para falar",
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
