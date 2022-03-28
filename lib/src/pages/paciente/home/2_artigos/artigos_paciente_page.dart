import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constant_identificadores.dart';
import 'package:fonoplay/src/pages/paciente/home/2_artigos/models/item_list_model.dart';
import 'package:fonoplay/src/pages/paciente/home/widgets/cards_artigos_jogos_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

import 'widgets/banner/banner_widget.dart';

class ArtigosPacientePage extends StatelessWidget {
  const ArtigosPacientePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemListModel> items = [
      ItemListModel(
        identificador: ConstantesIdentificadores.ARTIGO_SOBRE_APRAXIA,
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância \n(AFI) é um disturbio que \nafeta a produção motora\nde sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
      ItemListModel(
        identificador: ConstantesIdentificadores.ARTIGO_COMO_IDENTIFICAR,
        titulo: "Como identificar a AFI?",
        descricao:
            "Existe uma grande variedade\nde caracteristicas envolvidas\nnos quadros de AFI, variando\n de criança para criança.",
        pathImage: "assets/images/intro_2_pai_crianca.png",
      ),
      ItemListModel(
        identificador: ConstantesIdentificadores.ARTIGO_DIAGNOSTICO_TRATAMENTO,
        titulo: "Como tratar?",
        descricao:
            "É importante ressaltar que\nnem toda criança que\napresenta dificuldade em\nfalar tem AFI, por isso é mui...",
        pathImage: "assets/images/intro_1_fono_crianca.png",
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
              titulo: "Artigos para ler",
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          right: 0,
          left: 0,
          child: const BannerWidget(),
        ),
        Positioned(
          top: size.height * .33,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: size.height * 0.65,
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemListModel item = items[index];
                  return CardArtigosJogosWidget(
                    id: item.identificador,
                    titulo: item.titulo,
                    descricao: item.descricao,
                    pathImage: item.pathImage,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}


/*
 ItemListModel(
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância (AFI) é um disturbio que afeta a produção motora de sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
*/