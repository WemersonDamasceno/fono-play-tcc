import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constant_identificadores.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/paciente/home/2_artigos/models/item_list_model.dart';
import 'package:fonoplay/src/pages/paciente/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/paciente/home/widgets/cards_artigos_jogos_widget.dart';
import 'package:fonoplay/src/pages/widgets/button_floating_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class ListaDosJogosPage extends StatelessWidget {
  const ListaDosJogosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemListModel> items = [
      ItemListModel(
        identificador: ConstantesIdentificadores.JOGO_DA_MEMORIA,
        titulo: "Jogo da memória",
        descricao:
            "Além de exercitar a memória\neste jogos vai ajudar na \nmemória muscular.",
        pathImage: "assets/images/jogo_da_memoria.png",
      ),
      ItemListModel(
        identificador: ConstantesIdentificadores.JOGO_CONSEGUE_IMITAR,
        titulo: "Consegue me imitar?",
        descricao:
            "Este jogo é ótimo para a \nfamilia toda brincar junto e\n se divertir.",
        pathImage: "assets/images/consegue_me_imitar.png",
      ),
      ItemListModel(
        identificador: ConstantesIdentificadores.JOGO_BRINCANDO_COM_LINGUA,
        titulo: "Conhecendo os Animais",
        descricao:
            "Conheça os animais, além de \naprender a pronunciar as palavras",
        pathImage: "assets/images/conhecendo_animais.png",
      ),
    ];
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
              titulo: "Escolha um jogo",
            ),
          ),
        ),
        Positioned(
          top: size.height * .25,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CardArtigosJogosWidget(
                    id: item.identificador,
                    titulo: item.titulo,
                    descricao: item.descricao,
                    pathImage: item.pathImage,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
            top: size.height * 0.9,
            right: 0,
            child: ButtonFloatingWidget(
              onPressed: () {
                homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL);
              },
              icon: Icons.home,
              size: size,
              texto: "Pagina Inicial",
            ))
      ],
    );
  }
}
