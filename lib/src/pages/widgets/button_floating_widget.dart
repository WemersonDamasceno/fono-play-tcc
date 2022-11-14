import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class ButtonFloatingWidget extends StatelessWidget {
  final Size size;
  final Function() onPressed;
  final String texto;
  final IconData icon;
  const ButtonFloatingWidget({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.texto,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        gradient: AppColors.linearColors,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
        ),
        icon: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
        label: Icon(icon, color: Colors.white),
      ),
    );
  }
}
