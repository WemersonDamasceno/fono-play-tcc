import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
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
  }

  tocarSom(String audioEscolhido) {
    setState(() {
      _player.play(
        AssetSource("toque_para_falar/audios/$audioEscolhido"),
        volume: 1,
      );
    });
  }

  escolhaSomParaFalar(String audio) {
    switch (audio) {
      case "banheiro":
        tocarSom("banheiro.mp3");
        break;
      case "fome":
        tocarSom("fome.mp3");
        break;
      case "frio":
        tocarSom("frio.mp3");
        break;
      case "dor":
        tocarSom("dor.mp3");
        break;
      case "sono":
        tocarSom("sono.mp3");
        break;
      case "triste":
        tocarSom("triste.mp3");
        break;
      case "banho":
        tocarSom("banho.mp3");
        break;
      case "te_amo":
        tocarSom("te_amo.mp3");
        break;
      case "abraco":
        tocarSom("abraco.mp3");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 2.5;
    final double itemWidth = size.width * 0.5;
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
          top: size.height * 0.24,
          right: 10,
          left: 10,
          child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
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
                  onTap: () {},
                ),
                FonemasItemListWidget(
                  image: "fonema_F",
                  text: "Fonema F",
                  onTap: () {},
                ),
                FonemasItemListWidget(
                  image: "fonema_T",
                  text: "Fonema T",
                  onTap: () {},
                ),
                FonemasItemListWidget(
                  image: "fonema_K",
                  text: "Fonema K",
                  onTap: () {},
                ),
                FonemasItemListWidget(
                  image: "fonema_N",
                  text: "Fonema N",
                  onTap: () {},
                ),
                FonemasItemListWidget(
                  image: "fonema_NH",
                  text: "Fonema NH",
                  onTap: () {},
                ),
              ]),
        )
      ]),
    );
  }

  dialogFalarMensagem(size, context, image, mensagem) {
    escolhaSomParaFalar(image);
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        elevation: 0,
        content: Container(
          constraints: BoxConstraints(
            minHeight: size.height / 2.8,
            maxHeight: size.height / 2.3,
          ),
          child: Column(
            children: [
              Hero(
                tag: "TAG-$image",
                child: Image.asset(
                  "assets/toque_para_falar/$image.png",
                  width: size.width * 0.48,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "$mensagem",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.titlesColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
