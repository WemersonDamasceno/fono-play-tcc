import 'package:flutter/animation.dart';

class AnimalModel {
  final String nome;
  final String imagem;
  final Color cor;
  final String corString;
  final String backgroundHabitat;

  AnimalModel({
    required this.corString,
    required this.backgroundHabitat,
    required this.nome,
    required this.imagem,
    required this.cor,
  });
}
