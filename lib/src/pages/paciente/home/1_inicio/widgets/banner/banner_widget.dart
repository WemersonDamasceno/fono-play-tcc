import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/home/1_inicio/widgets/banner/banner_carousel_widget.dart';
import 'package:fonoplay/src/pages/paciente/home/1_inicio/widgets/banner/item_banner_model.dart';
import 'package:fonoplay/src/pages/screens_intro/view/widgets/bolinhas_row.dart';
import '/src/constants/constants_colors.dart';

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
            height: size.height * .22,
            width: size.width * .85,
            child: BannerCarousel(
              listImagens: bannerList.listImagens,
              pageController: _pageController,
              bannerEscolhida: _currentPage,
            ),
          ),
          Positioned(
            bottom: size.height * .135,
            left: size.width * 0.6,
            child: Image.asset(
              "assets/images/fono_explica.png",
              width: 120,
            ),
          ),
          Positioned(
            top: size.height * .24,
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
