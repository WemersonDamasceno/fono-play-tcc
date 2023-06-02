import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fonoplay/src/pages/widgets/button_gradiente_widget.dart';

import '/src/constants/constantes_avatars.dart';
import '/src/constants/constants_colors.dart';
import '../dados_da_crianca_page.dart';

class EscolherAvatarWidget extends StatefulWidget {
  const EscolherAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<EscolherAvatarWidget> createState() => _EscolherAvatarWidgetState();
}

class _EscolherAvatarWidgetState extends State<EscolherAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Escolha o avatar do perfil",
            style: TextStyle(fontSize: 16, color: AppColors.titlesColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              circleAvatarComBordas(
                pathImage: "assets/images/avatar_01.png",
                avatarPosition: 1,
                avatarConstante: ConstantesAvatar.AVATAR_01,
                size: size,
              ),
              circleAvatarComBordas(
                pathImage: "assets/images/avatar_02.png",
                avatarPosition: 2,
                avatarConstante: ConstantesAvatar.AVATAR_02,
                size: size,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              circleAvatarComBordas(
                pathImage: "assets/images/avatar_03.png",
                avatarPosition: 3,
                avatarConstante: ConstantesAvatar.AVATAR_03,
                size: size,
              ),
              circleAvatarComBordas(
                pathImage: "assets/images/avatar_04.png",
                avatarPosition: 4,
                avatarConstante: ConstantesAvatar.AVATAR_04,
                size: size,
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(top: size.height * 0.07, left: 20, right: 20),
            child: ButtonGradienteWidget(
              habilitarBotao: true,
              texto: "Escolher avatar",
              onPressed: () {
                controllerCrianca.mudarImage(controllerCrianca.avatar);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget circleAvatarComBordas({
    required String pathImage,
    required int avatarPosition,
    required int avatarConstante,
    required Size size,
  }) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        controllerCrianca.avatar = avatarPosition;
      },
      child: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(
              color: controllerCrianca.avatar == avatarConstante
                  ? AppColors.primaryColor
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          height: 100,
          width: 100,
          child: Card(
            elevation: 1,
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
      ),
    );
  }
}
