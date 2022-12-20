import 'package:fonoplay/src/pages/paciente/games/0_jogo_da_memoria/models/carta_memoria_model.dart';

class GameController {
  List<CartaMemoriaModel> listaDeCartas = [];

  final int quantidadeCartas = 12;

  List<Map<int, CartaMemoriaModel>> cartasIguais = [];
  int pontos = 0;

  void initGame() {
    cartasIguais = [];
    listaDeCartas = [];
    listaDeCartas.addAll([
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/macaco.png",
        isEscondida: true,
        valor: "macaco",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/girafa.png",
        isEscondida: true,
        valor: "girafa",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/macaco.png",
        isEscondida: true,
        valor: "macaco",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/gato.png",
        isEscondida: true,
        valor: "gato",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/leao.png",
        isEscondida: true,
        valor: "leao",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/girafa.png",
        isEscondida: true,
        valor: "girafa",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/leao.png",
        isEscondida: true,
        valor: "leao",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/gato.png",
        isEscondida: true,
        valor: "gato",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/peixe.png",
        isEscondida: true,
        valor: "peixe",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/elefante.png",
        isEscondida: true,
        valor: "elefante",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/peixe.png",
        isEscondida: true,
        valor: "peixe",
      ),
      CartaMemoriaModel(
        pathImage: "assets/jogo_memoria/elefante.png",
        isEscondida: true,
        valor: "elefante",
      ),
    ]);
  }

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
