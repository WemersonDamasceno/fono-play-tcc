import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/paciente/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/widgets/button_floating_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import 'package:lottie/lottie.dart';

class ListaDosJogosPage extends StatefulWidget {
  const ListaDosJogosPage({Key? key}) : super(key: key);

  @override
  State<ListaDosJogosPage> createState() => _ListaDosJogosPageState();
}

class _ListaDosJogosPageState extends State<ListaDosJogosPage> {
  late PageController pageController;
  double viewportFraction = 0.9;
  double pageOffset = 0;

  @override
  initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromARGB(255, 236, 236, 236),
      child: Stack(
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
            top: size.height * .2,
            right: 0,
            left: 0,
            child: SizedBox(
              height: size.height * .8,
              width: size.width,
              child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  double angle = (pageOffset - index).abs();
                  if (angle > 0.5) {
                    angle = 1 - angle;
                  }

                  // a lista deve ser infinita
                  if (index == 0) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/jogo_da_memoria"),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(angle),
                              alignment: Alignment.center,
                              child: LottieBuilder.asset(
                                "assets/images/animations/memoria.json",
                                reverse: true,
                              ),
                            ),
                          ),
                          Text(
                            "Jogo da Memória",
                            style: TextStyle(
                              color: Color(0xFF525252),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  if (index == 1) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(angle),
                            alignment: Alignment.center,
                            child: LottieBuilder.asset(
                              "assets/images/animations/animal.json",
                              reverse: true,
                            ),
                          ),
                        ),
                        Text(
                          "O Som dos Animais",
                          style: TextStyle(
                            color: Color(0xFF525252),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  }

                  return Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/consegue_me_imitar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: size.height * .5,
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.ease,
                        );
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 50,
                        color: Color(0xFF525252),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.ease,
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 50,
                        color: Color(0xFF525252),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.9,
              right: 0,
              child: ButtonFloatingWidget(
                onPressed: () =>
                    homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL),
                icon: Icons.home,
                size: size,
                texto: "Pagina Inicial",
              ))
        ],
      ),
    );
  }
}
