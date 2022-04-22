import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class ToqueParaFalarPage extends StatelessWidget {
  const ToqueParaFalarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const ContainerGradienteWidget(),
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
              child: const CabecalhoWidget(
                isGame: true,
                imagemPerfil: "assets/images/avatar_01.png",
                nomeCrianca: "Joãozinho",
                titulo: "Toque para falar",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
