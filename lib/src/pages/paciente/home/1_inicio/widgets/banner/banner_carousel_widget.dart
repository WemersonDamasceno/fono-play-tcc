import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class BannerCarousel extends StatelessWidget {
  final int bannerEscolhida;
  final PageController pageController;
  final List<Map<String, String>> listImagens;

  const BannerCarousel({
    Key? key,
    required this.bannerEscolhida,
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
          paginaEmDestaque: bannerEscolhida == index,
          descricao: listImagens[index]["descricao"]!,
          titulo: listImagens[index]["titulo"]!,
        );
      },
    );
  }
}

class PageSlide extends StatelessWidget {
  final String titulo;
  final String descricao;
  final bool paginaEmDestaque;

  const PageSlide({
    Key? key,
    required this.paginaEmDestaque,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double top = paginaEmDestaque ? 10 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.fromLTRB(0, top, 0, 30),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.18,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: ConstantColor.titlesColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.65,
                      child: Text(
                        descricao,
                        style: const TextStyle(
                            color: ConstantColor.descricaoColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
