import 'package:flutter/material.dart';
import '/src/constants/constants_colors.dart';
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
            child: Container(
              height: size.height * 0.07,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                gradient: ConstantColor.linearColors,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  _currentPage++;
                  if (_currentPage >= slideList.listImagens.length) {
                    //Navigator.of(context).popAndPushNamed('/singin');
                  }
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                ),
                icon: const Text(
                  "Avançar",
                  style: TextStyle(color: Colors.white),
                ),
                label: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
