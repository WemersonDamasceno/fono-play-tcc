import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/games/2_jogo_das_cores/models/animais_cores_model.dart';
import 'package:fonoplay/src/pages/games/2_jogo_das_cores/page/escolha_a_cor_page.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import 'package:lottie/lottie.dart';

class JogoDasCoresPage extends StatefulWidget {
  const JogoDasCoresPage({Key? key}) : super(key: key);

  @override
  State<JogoDasCoresPage> createState() => _JogoDasCoresPageState();
}

class _JogoDasCoresPageState extends State<JogoDasCoresPage>
    with TickerProviderStateMixin {
  late AudioPlayer _player;
  bool isLoading = true;
  late AnimationController animationController;
  Tween<double> tween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
      value: 0,
    )..forward();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        _player.play(AssetSource("images/animais_cores/audios/inicio.mp3"));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<AnimalModel> animaisCores = [
      AnimalModel(
        nome: "baleia",
        corString: "azul",
        imagem: "assets/images/animais_cores/animais/baleia.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/baleia.png",
        cor: Color(0xFF4193d1),
      ),
      AnimalModel(
        nome: "tartaruga",
        corString: "verde",
        imagem: "assets/images/animais_cores/animais/tartaruga.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/baleia.png",
        cor: Color(0xFF88bc41),
      ),
      AnimalModel(
        nome: "porco",
        corString: "salmao",
        imagem: "assets/images/animais_cores/animais/porco.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/fazenda.png",
        cor: Color(0xFFea828b),
      ),
      AnimalModel(
        nome: "pato",
        corString: "laranja",
        imagem: "assets/images/animais_cores/animais/pato.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/rio.png",
        cor: Color(0xFFf9b12c),
      ),
      AnimalModel(
        nome: "passaro",
        corString: "azul",
        imagem: "assets/images/animais_cores/animais/passaro.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/rio.png",
        cor: Color(0xFF36a9dc),
      ),
      AnimalModel(
        nome: "lula",
        corString: "lilas",
        imagem: "assets/images/animais_cores/animais/lula.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/baleia.png",
        cor: Color(0xFFa07ab4),
      ),
      AnimalModel(
        nome: "galo",
        corString: "vermelho",
        imagem: "assets/images/animais_cores/animais/galo.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/fazenda.png",
        cor: Color(0xFFbb1c2e),
      ),
      AnimalModel(
        nome: "estrela",
        corString: "amarelo",
        imagem: "assets/images/animais_cores/animais/estrela.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/baleia.png",
        cor: Color(0xFFf8d908),
      ),
      AnimalModel(
        nome: "burro",
        corString: "cinza",
        imagem: "assets/images/animais_cores/animais/burro.png",
        backgroundHabitat: "assets/images/animais_cores/habitatis/fazenda.png",
        cor: Color(0xFF444444),
      ),
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_cores.jpg"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              const ContainerGradienteWidget(),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: size.height * 0.01),
                  child: const CabecalhoWidget(
                    isGame: true,
                    imagemPerfil: "assets/images/avatar_01.png",
                    nomeCrianca: "Joãozinho",
                    titulo: "Conhecendo as cores",
                  ),
                ),
              ),
              Positioned(
                top: size.height * .25,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height * .8,
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 10),
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.85),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EscolhaACorPage(
                                  animaisCores: animaisCores[index],
                                  listAnimais: animaisCores,
                                ),
                              ),
                            );
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Hero(
                                tag: animaisCores[index].nome,
                                child: Image.asset(
                                  animaisCores[index].imagem,
                                  fit: BoxFit.contain,
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.25,
                child: Visibility(
                  visible: isLoading,
                  child: Container(
                    color: Colors.black,
                    height: size.height * 0.75,
                    width: size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LottieBuilder.asset(
                            "assets/images/animations/loading.json",
                            width: MediaQuery.of(context).size.width * 0.55,
                          ),
                          const SizedBox(height: 10),
                          AnimatedBuilder(
                              animation: animationController,
                              builder: (context, _) {
                                print(tween);
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white,
                                    value: tween.evaluate(animationController),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
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
