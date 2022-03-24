import 'package:flutter/material.dart';

class CardGameWidget extends StatefulWidget {
  final bool isEscondida;
  final String pathImage;

  const CardGameWidget({
    Key? key,
    required this.isEscondida,
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
      //onTap: () => flipCard(),
      child: Card(
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: widget.isEscondida
                  ? AssetImage("assets/images/hidden.png")
                  : AssetImage(widget.pathImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
