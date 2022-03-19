import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/screens_intro/view/widgets/bolinhas_row.dart';

import 'banner_carousel_widget.dart';
import 'item_banner_model.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  ItemBannerModel bannerList = ItemBannerModel();
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
    return SizedBox(
      height: size.height * .4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size.height * .2,
            width: size.width * .85,
            child: BannerCarousel(
              listImagens: bannerList.listImagens,
              pageController: _pageController,
              bannerEscolhida: _currentPage,
            ),
          ),
          Positioned(
            bottom: size.height * .136,
            left: size.width * 0.6,
            child: Image.asset(
              "assets/images/fono_explica.png",
              width: size.width * .35,
            ),
          ),
          Positioned(
            top: size.height * .23,
            child: BolinhasLinhas(
              paginaEmDestaque: _currentPage,
              tamanhoDaLista: bannerList.listImagens.length,
            ),
          ),
        ],
      ),
    );
  }
}
