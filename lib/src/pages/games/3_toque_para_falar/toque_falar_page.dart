import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/games/3_toque_para_falar/widgets/fala_card_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

class ToqueParaFalarPage extends StatefulWidget {
  const ToqueParaFalarPage({Key? key}) : super(key: key);

  @override
  State<ToqueParaFalarPage> createState() => _ToqueParaFalarPageState();
}

class _ToqueParaFalarPageState extends State<ToqueParaFalarPage> {
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
              titulo: "Toque para falar",
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
                FalaCardWidget(
                  image: "banheiro",
                  text: "Banheiro",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "banheiro",
                    "Quero ir ao banheiro!",
                  ),
                ),
                FalaCardWidget(
                  image: "te_amo",
                  text: "Amor",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "te_amo",
                    "Eu te amo!",
                  ),
                ),
                FalaCardWidget(
                  image: "banho",
                  text: "Banho",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "banho",
                    "Quero tomar banho!",
                  ),
                ),
                FalaCardWidget(
                  image: "frio",
                  text: "Frio",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "frio",
                    "Estou com frio!",
                  ),
                ),
                FalaCardWidget(
                  image: "triste",
                  text: "Triste",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "triste",
                    "Estou triste!",
                  ),
                ),
                FalaCardWidget(
                  image: "abraco",
                  text: "Abraço",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "abraco",
                    "Quero um abraco!",
                  ),
                ),
                FalaCardWidget(
                  image: "fome",
                  text: "Fome",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "fome",
                    "Estou com fome!",
                  ),
                ),
                FalaCardWidget(
                  image: "sono",
                  text: "Sono",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "sono",
                    "Estou com sono!",
                  ),
                ),
                FalaCardWidget(
                  image: "dor",
                  text: "Dor",
                  onTap: () => dialogFalarMensagem(
                    size,
                    context,
                    "dor",
                    "Estou com dor!",
                  ),
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
