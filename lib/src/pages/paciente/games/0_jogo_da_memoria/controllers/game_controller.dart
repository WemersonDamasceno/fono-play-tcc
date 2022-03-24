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
}
