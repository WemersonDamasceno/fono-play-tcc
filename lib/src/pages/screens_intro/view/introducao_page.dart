import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/pages/widgets/button_floating_widget.dart';

import '/src/pages/screens_intro/model/slide_list.dart';
import 'widgets/bolinhas_row.dart';
import 'widgets/slide_carousel.dart';

class IntroducaoPage extends StatefulWidget {
  const IntroducaoPage({Key? key}) : super(key: key);

  @override
  _IntroducaoPageState createState() => _IntroducaoPageState();
}

class _IntroducaoPageState extends State<IntroducaoPage> {
  SlideList slideList = SlideList();
  final PageController _pageController = PageController(viewportFraction: 1);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
            child: SlideCarousel(
              listImagens: slideList.listImagens,
              pageController: _pageController,
              paginaEscolhida: _currentPage,
            ),
          ),
          Positioned(
            top: size.height * .8,
            child: BolinhasLinhas(
              paginaEmDestaque: _currentPage,
              tamanhoDaLista: slideList.listImagens.length,
            ),
          ),
          Positioned(
            top: size.height * .87,
            left: size.width * .7,
            child: ButtonFloatingWidget(
              onPressed: () {
                _currentPage++;
                if (_currentPage >= slideList.listImagens.length) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => LoginCriarContaPage(),
                      ));
                }
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              },
              icon: Icons.arrow_forward_rounded,
              size: size,
              texto: "Avançar",
            ),
          ),
        ],
      ),
    );
  }
}
