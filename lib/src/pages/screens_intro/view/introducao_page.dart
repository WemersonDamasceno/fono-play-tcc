import 'package:flutter/material.dart';
import '/src/pages/screens_intro/model/slide_list.dart';
import 'bolinhas_row.dart';
import 'slide_carousel.dart';

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
            padding: EdgeInsets.only(top: size.height * 0.1),
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
            child: InkWell(
              child: Container(
                width: size.width * .3,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF207B5B),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Avançar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onTap: () {
                _currentPage++;
                if (_currentPage >= slideList.listImagens.length) {
                  //Navigator.of(context).popAndPushNamed('/singin');
                  print("Enviar pra tela de login");
                }
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              },
            ),
          ),
        ],
      ),
    );
  }
}
