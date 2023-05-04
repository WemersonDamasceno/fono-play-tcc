import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class CardGameWidget extends StatefulWidget {
  final bool estaEscondida;
  final String pathImage;

  const CardGameWidget({
    Key? key,
    required this.estaEscondida,
    required this.pathImage,
  }) : super(key: key);

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: AppColors.primaryColor,
        elevation: 6,
        child: widget.estaEscondida == false
            ? Container(
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage(widget.pathImage),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.all(20),
                child: Image.asset(
                  "assets/jogo_memoria/hidden.png",
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
