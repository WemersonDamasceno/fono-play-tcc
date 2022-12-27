import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fonoplay/src/pages/games/1_jogo_da_imitacao/components/animal_item_widget.dart';
import 'package:fonoplay/src/pages/games/1_jogo_da_imitacao/models/animal_item_model.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class JogoDaImitacaoPage extends StatefulWidget {
  const JogoDaImitacaoPage({Key? key}) : super(key: key);

  @override
  State<JogoDaImitacaoPage> createState() => _JogoDaImitacaoPageState();
}

class _JogoDaImitacaoPageState extends State<JogoDaImitacaoPage>
    with TickerProviderStateMixin {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  bool isLoading = true;
  late AnimationController animationController;
  Tween<double> tween = Tween<double>(begin: 0, end: 1);

  bool playing = false;
  late AudioPlayer _player;
  // late AudioCache cache;
  IconData iconPlay = Icons.play_circle_outline_rounded;

  AnimalItemModel animalFoco = AnimalItemModel(
    pathImage: "assets/jogo_imitacao/animais/cabra.png",
    som: "cabra",
  );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    initRecorder();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      animationBehavior: AnimationBehavior.preserve,
      value: 0,
    )..forward();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      log("Permission not granted");
      return;
    }

    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future<void> recorderAudio() async {
    await recorder.startRecorder(toFile: 'audio');
  }

  Future<void> stopAndPlayAudio() async {
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    //Play audio
    //TODO Tocar audio gravado

    // log(audioFile.);
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
                titulo: "Conhecendo as cores",
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
            top: height * 0.48,
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
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(5),
                  ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stopAndPlayAudio();
                    } else {
                      await recorderAudio();
                    }
                    setState(() {
                      log("set state");
                    });
                  },
                  child: Icon(
                    recorder.isRecording
                        ? Icons.stop_circle_outlined
                        : Icons.mic,
                    color: Color.fromARGB(255, 63, 63, 63),
                    size: 50,
                  ),
                ),
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
          Positioned(
            top: height * 0.25,
            child: Visibility(
              visible: isLoading,
              child: Container(
                color: Colors.black,
                height: height * 0.75,
                width: width,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
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
    );
  }
}
