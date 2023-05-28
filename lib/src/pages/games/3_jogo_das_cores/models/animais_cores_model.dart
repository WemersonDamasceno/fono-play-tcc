import 'package:flutter/animation.dart';

class AnimalModel {
  final String nome;
  final String imagem;
  final Color cor;
  final String corString;
  final String label;
  final String backgroundHabitat;

  AnimalModel({
    this.label = '',
    required this.corString,
    required this.backgroundHabitat,
    required this.nome,
    required this.imagem,
    required this.cor,
  });
}
