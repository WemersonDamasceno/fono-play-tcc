import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/widgets/button_floating_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import 'package:lottie/lottie.dart';

class ListaDosJogosPage extends StatefulWidget {
  const ListaDosJogosPage({Key? key}) : super(key: key);

  @override
  State<ListaDosJogosPage> createState() => _ListaDosJogosPageState();
}

class _ListaDosJogosPageState extends State<ListaDosJogosPage>
    with TickerProviderStateMixin {
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background_jogos.png"),
            fit: BoxFit.cover,
            opacity: 0.8),
      ),
      child: Stack(
        children: [
          const ContainerGradienteWidget(),
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
              child: CabecalhoWidget(
                isGame: false,
                onPressed: () {},
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
              height: size.height * .79,
              width: size.width,
              child: PageView.builder(
                controller: pageController,
                itemCount: 4,
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
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Jogo da Memória",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF525252),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  if (index == 1) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/jogo-dos-fonemas"),
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
                                "assets/images/animations/fonemas_game.json",
                                reverse: true,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Jogo dos Fonemas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF525252),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }

                  if (index == 2) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/jogo_da_imitacao"),
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
                                "assets/images/animations/animal.json",
                                reverse: true,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Conhecendo os Animais",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF525252),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, "/jogo_das_cores"),
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
                              "assets/images/animations/colors.json",
                              reverse: true,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Conhecendo as Cores",
                              style: TextStyle(
                                color: Color(0xFF525252),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
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
              top: size.height * 0.26,
              right: 0,
              child: ButtonFloatingWidget(
                onPressed: () =>
                    homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL),
                icon: Icons.home,
                size: size,
                texto: "Voltar para o inicio",
              ))
        ],
      ),
    );
  }
}
