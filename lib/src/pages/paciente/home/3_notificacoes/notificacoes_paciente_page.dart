import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/home/2_artigos/models/item_list_model.dart';
import 'package:fonoplay/src/pages/paciente/home/widgets/cards_artigos_jogos_widget.dart';

class NotificacoesPacientePage extends StatelessWidget {
  const NotificacoesPacientePage({Key? key}) : super(key: key);

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
    return SizedBox(
      height: size.height * 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return const Text("Notificacoes");
        },
      ),
    );
  }
}
