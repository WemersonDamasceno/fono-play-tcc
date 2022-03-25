import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/models/carta_memoria_model.dart';

class GameController {
  List<CartaMemoriaModel> listaDeCartas = [
    CartaMemoriaModel(
      pathImage: "assets/images/macaco.png",
      isEscondida: true,
      valor: "macaco",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/girafa.png",
      isEscondida: true,
      valor: "girafa",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/macaco.png",
      isEscondida: true,
      valor: "macaco",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cachorro.png",
      isEscondida: true,
      valor: "cachorro",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/leao.png",
      isEscondida: true,
      valor: "leao",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/girafa.png",
      isEscondida: true,
      valor: "girafa",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/leao.png",
      isEscondida: true,
      valor: "leao",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cachorro.png",
      isEscondida: true,
      valor: "cachorro",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cobra.png",
      isEscondida: true,
      valor: "cobra",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/elefante.png",
      isEscondida: true,
      valor: "elefante",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/cobra.png",
      isEscondida: true,
      valor: "cobra",
    ),
    CartaMemoriaModel(
      pathImage: "assets/images/elefante.png",
      isEscondida: true,
      valor: "elefante",
    ),
  ];

  final int quantidadeCartas = 12;

  List<Map<int, CartaMemoriaModel>> cartasIguais = [];
  int pontos = 0;

  void virarCarta(int index) {
    if (listaDeCartas[index].isEscondida) {
      listaDeCartas[index].isEscondida = false;
      cartasIguais.add(
        {index: listaDeCartas[index]},
      );
    }
    //se as cartas forem iguais
    if (cartasIguais.length == 2) {
      if (cartasIguais[0].values.first.valor ==
          cartasIguais[1].values.first.valor) {
        pontos += 100;
        cartasIguais.clear();
      }
    } else {
      //se não forem igual limpa
      Future.delayed(const Duration(milliseconds: 500), () {
        listaDeCartas[cartasIguais[0].keys.first].isEscondida = true;
        listaDeCartas[cartasIguais[1].keys.first].isEscondida = true;
        cartasIguais.clear();
      });
    }
  }
}
