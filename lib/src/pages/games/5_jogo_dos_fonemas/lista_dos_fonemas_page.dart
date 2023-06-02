import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/fonemas_escolhido_game.dart';
import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/widgets/fonemas_item_list_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

import '../../widgets/cabecalho_widget.dart';

class ListaDosFonemasPage extends StatefulWidget {
  const ListaDosFonemasPage({Key? key}) : super(key: key);

  @override
  State<ListaDosFonemasPage> createState() => _ListaDosFonemasPageState();
}

class _ListaDosFonemasPageState extends State<ListaDosFonemasPage> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.play(
      AssetSource("fonemas/audios/inicio.mp3"),
      volume: 0.4,
    );
  }

  tocarSom(String audioEscolhido) {
    setState(() {
      _player.play(
        AssetSource("toque_para_falar/audios/$audioEscolhido"),
        volume: 0.4,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 2.4;
    final double itemWidth = size.width * 0.6;
    return Scaffold(
      body: Stack(children: [
        const ContainerGradienteWidget(),
        SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
            child: CabecalhoWidget(
              isGame: true,
              imagemPerfil: "assets/images/avatar_01.png",
              nomeCrianca: "Joãozinho",
              onPressed: () => _player.stop(),
              titulo: "Escolha um Fonema",
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.25,
          right: 10,
          left: 10,
          child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 8,
              mainAxisSpacing: 18,
              scrollDirection: Axis.vertical,
              childAspectRatio: (itemWidth / itemHeight),
              controller: ScrollController(keepScrollOffset: false),
              children: [
                FonemasItemListWidget(
                  image: "fonema_B",
                  text: "Fonema B",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "b",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_M",
                  text: "Fonema M",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "m",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_D",
                  text: "Fonema D",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "d",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_P",
                  text: "Fonema P",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "p",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_G",
                  text: "Fonema G",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "g",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_T",
                  text: "Fonema T",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "t",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_K",
                  text: "Fonema K",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "k",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_N",
                  text: "Fonema N",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "n",
                        ),
                      ),
                    );
                  },
                ),
                FonemasItemListWidget(
                  image: "fonema_NH",
                  text: "Fonema NH",
                  onTap: () {
                    _player.stop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FonemasEscolhidoGame(
                          fonemaEscolhido: "nh",
                        ),
                      ),
                    );
                  },
                ),
              ]),
        )
      ]),
    );
  }
}
