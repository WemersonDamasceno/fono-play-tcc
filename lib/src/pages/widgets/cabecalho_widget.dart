import 'package:flutter/material.dart';

class CabecalhoWidget extends StatelessWidget {
  final String imagemPerfil;
  final String nomeCrianca;
  final String titulo;
  final bool isGame;
  final VoidCallback onPressed;
  const CabecalhoWidget({
    Key? key,
    required this.imagemPerfil,
    required this.nomeCrianca,
    required this.titulo,
    required this.isGame,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Hero(
                      tag: "avatar",
                      child: Image.asset(imagemPerfil),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Olá, $nomeCrianca!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  if (isGame) {
                    onPressed();
                    Navigator.pop(context);
                  } else {
                    Scaffold.of(context).openEndDrawer();
                  }
                },
                icon: Icon(
                  isGame ? Icons.close_rounded : Icons.clear_all,
                  color: Colors.white,
                  size: 40,
                ))
          ],
        ),
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        )
      ],
    );
  }
}
