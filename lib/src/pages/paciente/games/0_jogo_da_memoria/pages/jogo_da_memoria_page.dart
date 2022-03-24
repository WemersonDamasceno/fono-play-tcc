import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/components/card_game_widget.dart';
import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/controllers/game_controller.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class JogoDaMemoriaPage extends StatefulWidget {
  const JogoDaMemoriaPage({Key? key}) : super(key: key);

  @override
  State<JogoDaMemoriaPage> createState() => _JogoDaMemoriaPageState();
}

class _JogoDaMemoriaPageState extends State<JogoDaMemoriaPage> {
  int pontos = 0;
  final game = GameController();

  @override
  void initState() {
    super.initState();
    game.listaDeCartas.shuffle();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                imagemPerfil: "assets/images/avatar_01.png",
                nomeCrianca: "Joãozinho",
                titulo: "Jogo da memória",
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.25,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pontos: $pontos",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: ConstantColor.titlesColor,
                        ),
                      )),
                ),
                SizedBox(
                  height: size.height * .7,
                  width: size.width * 0.9,
                  child: GridView.builder(
                    itemCount: game.quantidadeCartas,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      var item = game.listaDeCartas[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (game.listaDeCartas[index].isEscondida) {
                              game.listaDeCartas[index].isEscondida = false;
                              game.cartasIguais.add(
                                {index: game.listaDeCartas[index]},
                              );
                            }
                          });
                          //se as cartas forem iguais
                          if (game.cartasIguais.length == 2) {
                            if (game.cartasIguais[0].values.first.valor ==
                                game.cartasIguais[1].values.first.valor) {
                              pontos += 100;
                              game.cartasIguais.clear();
                            } else {
                              //se não forem igual limpa
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  game
                                      .listaDeCartas[
                                          game.cartasIguais[0].keys.first]
                                      .isEscondida = true;
                                  game
                                      .listaDeCartas[
                                          game.cartasIguais[1].keys.first]
                                      .isEscondida = true;
                                  game.cartasIguais.clear();
                                });
                              });
                            }
                          }
                        },
                        child: CardGameWidget(
                          isEscondida: item.isEscondida,
                          pathImage: game.listaDeCartas[index].pathImage,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
