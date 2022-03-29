import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/games/1_jogo_da_imitacao/components/animal_item_widget.dart';
import 'package:fonoplay/src/pages/paciente/games/1_jogo_da_imitacao/models/animal_item_model.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class JogoDaImitacaoPage extends StatefulWidget {
  const JogoDaImitacaoPage({Key? key}) : super(key: key);

  @override
  State<JogoDaImitacaoPage> createState() => _JogoDaImitacaoPageState();
}

class _JogoDaImitacaoPageState extends State<JogoDaImitacaoPage> {
  bool playing = false;
  late AudioPlayer _player;
  late AudioCache cache;
  IconData iconPlay = Icons.play_circle_outline_rounded;

  AnimalItemModel animalFoco = AnimalItemModel(
    pathImage: "assets/jogo_imitacao/animais/cabra.png",
    som: "cabra",
  );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);
  }

  escolhaAnimalReproduzirFonema(String animalSom) {
    switch (animalSom) {
      case "vaca":
        tocarSom("fonema_m.mp3");
        break;
      case "cobra":
        tocarSom("fonema_s.mp3");
        break;
      case "abelha":
        tocarSom("fonema_z.mp3");
        break;
      case "cabra":
        tocarSom("fonema_m2.mp3");
        break;
      case "galinha":
        tocarSom("fonema_p.mp3");
        break;
    }
  }

  tocarSom(String fonemaEscolhido) {
    setState(() {
      if (!playing) {
        iconPlay = Icons.pause_circle_outline_rounded;
        cache.play("jogo_imitacao/audios/$fonemaEscolhido");
        playing = true;
        Future.delayed(const Duration(milliseconds: 2500)).then((value) {
          setState(() {
            iconPlay = Icons.play_circle_outline_rounded;
            playing = false;
          });
        });
      } else {
        iconPlay = Icons.play_circle_outline_rounded;
        _player.pause();
        playing = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const ContainerGradienteWidget(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: height * 0.01),
              child: const CabecalhoWidget(
                isGame: true,
                imagemPerfil: "assets/images/avatar_01.png",
                nomeCrianca: "Joãozinho",
                titulo: "Jogo da imitação",
              ),
            ),
          ),
          Positioned(
            top: height * 0.33,
            right: 0,
            left: 0,
            child: Image.asset("assets/jogo_imitacao/palco.jpg"),
          ),
          Positioned(
            top: height * 0.43,
            right: 0,
            left: 0,
            child: SizedBox(
              height: height * 0.2,
              child: Image.asset(animalFoco.pathImage),
            ),
          ),
          Positioned(
            top: height * 0.7,
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      escolhaAnimalReproduzirFonema(animalFoco.som);
                    },
                    child: Icon(
                      iconPlay,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.mic_none_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              height: height * 0.2,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/jogo_imitacao/animais/cabra.png";
                        animalFoco.som = "cabra";
                      });
                    },
                    pathImage: "assets/jogo_imitacao/animais/cabra.png",
                    padding: 0,
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/jogo_imitacao/animais/vaca.png";
                        animalFoco.som = "vaca";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/jogo_imitacao/animais/vaca.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/jogo_imitacao/animais/abelha.png";
                        animalFoco.som = "abelha";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/jogo_imitacao/animais/abelha.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/jogo_imitacao/animais/galinha.png";
                        animalFoco.som = "galinha";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/jogo_imitacao/animais/galinha.png",
                  ),
                  AnimalItemWidget(
                    onPressed: () {
                      setState(() {
                        animalFoco.pathImage =
                            "assets/jogo_imitacao/animais/cobra.png";
                        animalFoco.som = "cobra";
                      });
                    },
                    padding: 0,
                    pathImage: "assets/jogo_imitacao/animais/cobra.png",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
