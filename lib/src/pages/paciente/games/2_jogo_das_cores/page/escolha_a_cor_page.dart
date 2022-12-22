import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/games/2_jogo_das_cores/models/animais_cores_model.dart';
import 'package:fonoplay/src/pages/widgets/button_gradiente_widget.dart';
import 'package:lottie/lottie.dart';

class EscolhaACorPage extends StatefulWidget {
  final AnimalCor animaisCores;
  final List<AnimalCor> listAnimais;
  const EscolhaACorPage(
      {Key? key, required this.animaisCores, required this.listAnimais})
      : super(key: key);

  @override
  State<EscolhaACorPage> createState() => _EscolhaACorPageState();
}

class _EscolhaACorPageState extends State<EscolhaACorPage> {
  @override
  void initState() {
    //TODO Qual a cor do animal?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.animaisCores.backgroundHabitat),
              fit: BoxFit.cover,
              opacity: 0.8),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: widget.animaisCores.nome,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Image.asset(
                        widget.animaisCores.imagem,
                        fit: BoxFit.contain,
                        width: 250,
                        height: 250,
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
                    child: Text(
                      "Qual a cor da ${widget.animaisCores.nome.toLowerCase()}?",
                      style: TextStyle(
                        color: Color(0xFF525252),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Wrap(
                      children: widget.listAnimais
                          .map(
                            (e) => Container(
                              margin:
                                  EdgeInsets.only(top: 8, left: 8, right: 8),
                              child: InkWell(
                                onTap: () {
                                  if (e.cor == widget.animaisCores.cor) {
                                    showDialogFeedback(true, context, size);
                                  } else {
                                    showDialogFeedback(false, context, size);
                                  }
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: e.cor,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 119, 119, 119),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_back_outlined))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogFeedback(bool isCorrect, BuildContext context, Size size) {
    return showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          height: size.height / 1.9,
          child: Column(
            children: [
              Visibility(
                visible: isCorrect,
                child: LottieBuilder.asset(
                  "assets/images/animations/estrela_oculos_animacao.json",
                  width: size.width * 0.45,
                ),
                replacement: LottieBuilder.asset(
                  "assets/images/animations/failed.json",
                  width: size.width * 0.45,
                ),
              ),
              Text(
                isCorrect ? "Parabéns!" : "Que pena!",
                style: TextStyle(
                  color: Color(0xFFebc600),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 4,
                ),
              ),
              Text(
                isCorrect
                    ? "Seu exercício foi concluido!"
                    : "Você errou, mas não desista!",
                style: TextStyle(
                    color: Color(0xFFebc600),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonGradienteWidget(
                texto: isCorrect ? "Continuar" : "Tentar novamente",
                onPressed: () {
                  if (isCorrect) Navigator.pop(context);
                  Navigator.pop(context);
                },
                habilitarBotao: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
