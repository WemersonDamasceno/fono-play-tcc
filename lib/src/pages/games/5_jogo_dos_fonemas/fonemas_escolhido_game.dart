import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/utils/get_fonema.dart';
import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/widgets/fonemas_item_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class FonemasEscolhidoGame extends StatefulWidget {
  final String fonemaEscolhido;

  const FonemasEscolhidoGame({Key? key, required this.fonemaEscolhido})
      : super(key: key);

  @override
  State<FonemasEscolhidoGame> createState() => _FonemasEscolhidoGameState();
}

class _FonemasEscolhidoGameState extends State<FonemasEscolhidoGame> {
  late AudioPlayer _player;
  late List<FonemaModel> listFonemas;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    listFonemas = getFonema(widget.fonemaEscolhido);
    listFonemas.shuffle();
    _player.play(
      AssetSource(
        "fonemas/fonemas_${widget.fonemaEscolhido}/inicio-fonemas-${widget.fonemaEscolhido}.mp3",
      ),
      volume: 0.4,
    );
  }

  escolhaSomParaFalar(String audio) {
    _player.play(
      AssetSource(
        "fonemas/fonemas_${widget.fonemaEscolhido}/${audio.toLowerCase()}.mp3",
      ),
      volume: 0.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 2.6;
    final double itemWidth = size.width * 0.6;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _player.pause();
        },
        child: Stack(children: [
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
                titulo: "Fonema ${widget.fonemaEscolhido.toUpperCase()}",
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
              mainAxisSpacing: 20,
              scrollDirection: Axis.vertical,
              childAspectRatio: (itemWidth / itemHeight),
              controller: ScrollController(keepScrollOffset: false),
              children: listFonemas
                  .where((element) =>
                      element.fonemaPath == "fonemas_" + widget.fonemaEscolhido)
                  .map((e) {
                return FonemasItemWidget(
                  image: e.fonemaImage,
                  text: e.fonema,
                  pathFonema: e.fonemaPath,
                  onTap: () => dialogFalarMensagem(
                    size: size,
                    context: context,
                    image: e.fonemaImage,
                    mensagem: e.fonema,
                  ),
                );
              }).toList(),
            ),
          )
        ]),
      ),
    );
  }

  dialogFalarMensagem({size, context, image, mensagem}) {
    escolhaSomParaFalar(image);
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        elevation: 0,
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: "TAG-$image",
                child: Image.asset(
                  "assets/fonemas/fonemas_${widget.fonemaEscolhido}/$image.png",
                  width: size.width * 0.48,
                  height: size.height * 0.3,
                  fit: BoxFit.contain,
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

class FonemaModel {
  final String fonema;
  final String fonemaPath;
  final String fonemaImage;
  final String fonemaAudio;

  FonemaModel({
    required this.fonema,
    required this.fonemaPath,
    required this.fonemaImage,
    required this.fonemaAudio,
  });
}
