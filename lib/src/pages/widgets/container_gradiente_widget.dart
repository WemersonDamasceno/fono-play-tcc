import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class ContainerGradienteWidget extends StatelessWidget {
  const ContainerGradienteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
        height: size.height * 0.25,
        decoration: const BoxDecoration(
          gradient: AppColors.linearColors,
        ),
      ),
    );
  }
}
