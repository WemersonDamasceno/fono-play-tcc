import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/fonemas_escolhido_game.dart';

List<FonemaModel> getFonema(String fonema) {
  switch (fonema) {
    case "b":
      return [
        FonemaModel(
          fonema: "ABELHA",
          fonemaPath: "fonemas_b",
          fonemaImage: "abelha",
          fonemaAudio: "abelha.mp3",
        ),
        FonemaModel(
          fonema: "BOLO",
          fonemaPath: "fonemas_b",
          fonemaImage: "bolo",
          fonemaAudio: "bolo.mp3",
        ),
        FonemaModel(
          fonema: "LOBO",
          fonemaPath: "fonemas_b",
          fonemaImage: "lobo",
          fonemaAudio: "lobo.mp3",
        ),
        FonemaModel(
          fonema: "BALA",
          fonemaPath: "fonemas_b",
          fonemaImage: "bala",
          fonemaAudio: "bala.mp3",
        ),
        FonemaModel(
          fonema: "BANANA",
          fonemaPath: "fonemas_b",
          fonemaImage: "banana",
          fonemaAudio: "banana.mp3",
        ),
        FonemaModel(
          fonema: "BATATA",
          fonemaPath: "fonemas_b",
          fonemaImage: "batata",
          fonemaAudio: "batata.mp3",
        ),
        FonemaModel(
          fonema: "BEBÊ",
          fonemaPath: "fonemas_b",
          fonemaImage: "bebe",
          fonemaAudio: "bebe.mp3",
        ),
        FonemaModel(
          fonema: "BOLA",
          fonemaPath: "fonemas_b",
          fonemaImage: "bola",
          fonemaAudio: "bola.mp3",
        ),
        FonemaModel(
          fonema: "BONECA",
          fonemaPath: "fonemas_b",
          fonemaImage: "boneca",
          fonemaAudio: "boneca.mp3",
        ),
      ];
    case "m":
      return [
        FonemaModel(
          fonema: "MAÇÃ",
          fonemaPath: "fonemas_m",
          fonemaImage: "maca",
          fonemaAudio: "maca.mp3",
        ),
        FonemaModel(
          fonema: "MALA",
          fonemaPath: "fonemas_m",
          fonemaImage: "mala",
          fonemaAudio: "mala.mp3",
        ),
        FonemaModel(
          fonema: "MAMÃO",
          fonemaPath: "fonemas_m",
          fonemaImage: "mamao",
          fonemaAudio: "mamao.mp3",
        ),
        FonemaModel(
          fonema: "MAPA",
          fonemaPath: "fonemas_m",
          fonemaImage: "mapa",
          fonemaAudio: "mapa.mp3",
        ),
        FonemaModel(
          fonema: "MARTELO",
          fonemaPath: "fonemas_m",
          fonemaImage: "martelo",
          fonemaAudio: "martelo.mp3",
        ),
        FonemaModel(
          fonema: "MELANCIA",
          fonemaPath: "fonemas_m",
          fonemaImage: "melancia",
          fonemaAudio: "melancia.mp3",
        ),
        FonemaModel(
          fonema: "MOTO",
          fonemaPath: "fonemas_m",
          fonemaImage: "moto",
          fonemaAudio: "moto.mp3",
        ),
        FonemaModel(
          fonema: "MINHOCA",
          fonemaPath: "fonemas_m",
          fonemaImage: "minhoca",
          fonemaAudio: "minhoca.mp3",
        ),
        FonemaModel(
          fonema: "MOCHILA",
          fonemaPath: "fonemas_m",
          fonemaImage: "mochila",
          fonemaAudio: "mochila.mp3",
        ),
      ];
    case 'd':
      return [
        FonemaModel(
          fonema: "DADO",
          fonemaPath: "fonemas_d",
          fonemaImage: "dado",
          fonemaAudio: "dado.mp3",
        ),
        FonemaModel(
          fonema: "DENTE",
          fonemaPath: "fonemas_d",
          fonemaImage: "dente",
          fonemaAudio: "dente.mp3",
        ),
        FonemaModel(
          fonema: "DENTISTA",
          fonemaPath: "fonemas_d",
          fonemaImage: "dentista",
          fonemaAudio: "dentista.mp3",
        ),
        FonemaModel(
          fonema: "DESENHO",
          fonemaPath: "fonemas_d",
          fonemaImage: "desenho",
          fonemaAudio: "desenho.mp3",
        ),
        FonemaModel(
          fonema: "DESPERTADOR",
          fonemaPath: "fonemas_d",
          fonemaImage: "despertador",
          fonemaAudio: "despertador.mp3",
        ),
        FonemaModel(
          fonema: "DINOSSAURO",
          fonemaPath: "fonemas_d",
          fonemaImage: "dinossauro",
          fonemaAudio: "dinossauro.mp3",
        ),
        FonemaModel(
          fonema: "DISCO",
          fonemaPath: "fonemas_d",
          fonemaImage: "disco",
          fonemaAudio: "disco.mp3",
        ),
        FonemaModel(
          fonema: "DOCE",
          fonemaPath: "fonemas_d",
          fonemaImage: "doce",
          fonemaAudio: "doce.mp3",
        ),
        FonemaModel(
          fonema: "DOIS",
          fonemaPath: "fonemas_d",
          fonemaImage: "dois",
          fonemaAudio: "dois.mp3",
        ),
      ];

    default:
      return [];
  }
}
