import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class SlideCarousel extends StatelessWidget {
  final int paginaEscolhida;
  final PageController pageController;
  final List<Map<String, String>> listImagens;

  const SlideCarousel({
    Key? key,
    required this.paginaEscolhida,
    required this.pageController,
    required this.listImagens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: listImagens.length,
      itemBuilder: (_, index) {
        return PageSlide(
          paginaEmDestaque: paginaEscolhida == index,
          imagem: listImagens[index]["image"]!,
          descricao: listImagens[index]["descricao"]!,
          titulo: listImagens[index]["titulo"]!,
        );
      },
    );
  }
}

class PageSlide extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String descricao;
  final bool paginaEmDestaque;

  const PageSlide({
    Key? key,
    required this.imagem,
    required this.paginaEmDestaque,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = paginaEmDestaque ? 30 : 100;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.fromLTRB(0, top, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagem,
            width: MediaQuery.of(context).size.width * .8,
          ),
          Text(
            titulo,
            style: const TextStyle(
              color: ConstantColor.titlesColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            descricao,
            style: const TextStyle(color: ConstantColor.descricaoColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
