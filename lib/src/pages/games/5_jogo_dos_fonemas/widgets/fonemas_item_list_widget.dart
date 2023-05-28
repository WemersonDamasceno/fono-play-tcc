import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class FonemasItemListWidget extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;

  const FonemasItemListWidget(
      {Key? key, required this.image, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/fonemas/images/$image.png",
              height: 90,
              width: size.width,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: size.width * 0.27,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100)),
                ),
                child: Hero(
                  tag: "TAG-$image",
                  child: Text(
                    "$text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
