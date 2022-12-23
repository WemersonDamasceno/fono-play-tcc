import 'package:mobx/mobx.dart';
part '../stores/dados_crianca_controller.g.dart';

class ControllerDadosCrianca = _ControllerDadosCrianca
    with _$ControllerDadosCrianca;

abstract class _ControllerDadosCrianca with Store {
  @observable
  int avatar = 1;

  @observable
  String pathImage = "assets/images/avatar_01.png";

  @action
  mudarImage(int novoAvatar) {
    avatar = novoAvatar;
    switch (avatar) {
      case 1:
        pathImage = "assets/images/avatar_01.png";
        break;
      case 2:
        pathImage = "assets/images/avatar_02.png";
        break;
      case 3:
        pathImage = "assets/images/avatar_03.png";
        break;
      case 4:
        pathImage = "assets/images/avatar_04.png";
        break;
    }
  }
}
