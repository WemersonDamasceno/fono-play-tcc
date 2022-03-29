import 'package:flutter/material.dart';

class AnimalItemWidget extends StatelessWidget {
  final String pathImage;
  final double padding;
  final Function() onPressed;
  const AnimalItemWidget({
    Key? key,
    required this.onPressed,
    required this.pathImage,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(top: padding),
        child: Image.asset(
          pathImage,
          width: width * 0.23,
        ),
      ),
    );
  }
}
