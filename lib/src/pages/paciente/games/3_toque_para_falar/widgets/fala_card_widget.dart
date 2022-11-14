import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class FalaCardWidget extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;

  const FalaCardWidget(
      {Key? key, required this.image, required this.text, required this.onTap})
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/toque_para_falar/$image.png"),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: size.width * 0.25,
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
