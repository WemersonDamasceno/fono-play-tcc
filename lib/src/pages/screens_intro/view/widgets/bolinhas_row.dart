import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class BolinhasLinhas extends StatelessWidget {
  final int paginaEmDestaque;
  final int tamanhoDaLista;
  const BolinhasLinhas(
      {Key? key, required this.paginaEmDestaque, required this.tamanhoDaLista})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          tamanhoDaLista,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: const EdgeInsets.only(left: 5, right: 5),
                width: paginaEmDestaque == index ? 15 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: paginaEmDestaque == index
                      ? AppColors.primaryColor
                      : Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
