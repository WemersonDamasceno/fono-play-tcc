import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/home/1_inicio/widgets/banner/banner_widget.dart';
import 'package:fonoplay/src/pages/paciente/home/2_artigos/models/item_list_model.dart';
import 'package:fonoplay/src/pages/paciente/home/3_notificacoes/notificacoes_paciente_page.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class ArtigosPacientePage extends StatelessWidget {
  const ArtigosPacientePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemListModel> items = [
      ItemListModel(
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância (AFI) é um disturbio que afeta a produção motora de sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
      ItemListModel(
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância (AFI) é um disturbio que afeta a produção motora de sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
      ItemListModel(
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância (AFI) é um disturbio que afeta a produção motora de sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
      ItemListModel(
        titulo: "O que é apraxia de fala?",
        descricao:
            "A apraxia de fala na infância (AFI) é um disturbio que afeta a produção motora de sons da fala.",
        pathImage: "assets/images/fono_explica.png",
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ContainerGradienteWidget(),
        SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
            child: const CabecalhoWidget(
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
          top: size.height * .36,
          right: 0,
          left: 0,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NotificacoesPacientePage(),
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