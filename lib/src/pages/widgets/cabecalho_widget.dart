import 'package:flutter/material.dart';

import '../../utils/shared_preferences.dart';

class CabecalhoWidget extends StatefulWidget {
  final String titulo;
  final bool isGame;
  final VoidCallback onPressed;
  const CabecalhoWidget({
    Key? key,
    required this.titulo,
    required this.isGame,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CabecalhoWidget> createState() => _CabecalhoWidgetState();
}

class _CabecalhoWidgetState extends State<CabecalhoWidget> {
  late SharedPref _sharedPref;
  String nomeCrianca = "";
  String pathImage = 'assets/images/avatar_01.png';

  @override
  void initState() {
    super.initState();

    _sharedPref = SharedPref();
    getDataKid();
  }

  getDataKid() async {
    nomeCrianca = await _sharedPref.read("nameKid") ?? "Não definido";
    pathImage =
        await _sharedPref.read("avatarKid") ?? "assets/images/avatar_01.png";
    setState(() {});
  }

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
                      child: Image.asset(pathImage),
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
                  if (widget.isGame) {
                    widget.onPressed();
                    Navigator.pop(context);
                  } else {
                    Scaffold.of(context).openEndDrawer();
                  }
                },
                icon: Icon(
                  widget.isGame ? Icons.close_rounded : Icons.clear_all,
                  color: Colors.white,
                  size: 40,
                ))
          ],
        ),
        Text(
          widget.titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
