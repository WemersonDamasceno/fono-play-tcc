import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/components/card_game_widget.dart';
import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/controllers/game_controller.dart';
import 'package:fonoplay/src/pages/widgets/button_gradiente_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import 'package:lottie/lottie.dart';

class JogoDaMemoriaPage extends StatefulWidget {
  const JogoDaMemoriaPage({Key? key}) : super(key: key);

  @override
  State<JogoDaMemoriaPage> createState() => _JogoDaMemoriaPageState();
}

class _JogoDaMemoriaPageState extends State<JogoDaMemoriaPage> {
  int pontos = 0;
  final gameController = GameController();
  bool exibirAnimacao = false;

  @override
  void initState() {
    super.initState();
    gameController.initGame();
    gameController.listaDeCartas.shuffle();
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
                isGame: true,
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
            child: listaDasCartas(size),
          ),
        ],
      ),
    );
  }

  Widget listaDasCartas(Size size) {
    return Column(
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
            itemCount: gameController.quantidadeCartas,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              var item = gameController.listaDeCartas[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (gameController.listaDeCartas[index].isEscondida) {
                      gameController.listaDeCartas[index].isEscondida = false;
                      gameController.cartasIguais.add(
                        {index: gameController.listaDeCartas[index]},
                      );
                    }
                  });
                  //se as cartas forem iguais
                  if (gameController.cartasIguais.length == 2) {
                    if (gameController.cartasIguais[0].values.first.valor ==
                        gameController.cartasIguais[1].values.first.valor) {
                      pontos += 100;
                      gameController.cartasIguais.clear();

                      //Se atingir os 600 pontos, acabou o jogo
                      if (pontos == 600) {
                        setState(() {
                          exibirAnimacao = true;
                          dialogComemoracao(size);
                        });
                      }
                    } else {
                      //Se não forem igual limpa
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          gameController
                              .listaDeCartas[
                                  gameController.cartasIguais[0].keys.first]
                              .isEscondida = true;
                          gameController
                              .listaDeCartas[
                                  gameController.cartasIguais[1].keys.first]
                              .isEscondida = true;
                          gameController.cartasIguais.clear();
                        });
                      });
                    }
                  }
                },
                child: CardGameWidget(
                  isEscondida: item.isEscondida,
                  pathImage: gameController.listaDeCartas[index].pathImage,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  dialogComemoracao(size) {
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          height: size.height / 1.8,
          child: Column(
            children: [
              LottieBuilder.asset(
                "assets/images/animations/estrela_oculos_animacao.json",
                width: size.width * 0.48,
              ),
              const Text(
                "Parabéns!",
                style: TextStyle(
                  color: Color(0xFFebc600),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
              const Text(
                "Seu exercício foi concluido!",
                style: TextStyle(
                  color: Color(0xFFebc600),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradienteWidget(
                texto: "Continuar",
                onPressed: () {
                  Navigator.pop(context);
                },
                habilitarBotao: true,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    pontos = 0;
                    Navigator.pop(context);
                    gameController.initGame();
                  });
                },
                child: const Text(
                  "Jogar novamente",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
