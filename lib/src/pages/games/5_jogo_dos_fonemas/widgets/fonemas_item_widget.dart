import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class FonemasItemWidget extends StatelessWidget {
  final String image;
  final String pathFonema;
  final String text;
  final Function onTap;

  const FonemasItemWidget(
      {Key? key,
      required this.image,
      required this.text,
      required this.onTap,
      required this.pathFonema})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            width: 3,
            color: AppColors.primaryColor,
          ),
        ),
        child: Image.asset(
          "assets/fonemas/$pathFonema/$image.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
