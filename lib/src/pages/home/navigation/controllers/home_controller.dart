import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/home/0_inicio/inicio_paciente_page.dart';
import 'package:fonoplay/src/pages/home/1_jogos/list_jogos_page.dart';
import 'package:fonoplay/src/pages/home/2_artigos/artigos_paciente_page.dart';
import 'package:fonoplay/src/pages/home/3_notificacoes/notificacoes_paciente_page.dart';
import 'package:fonoplay/src/pages/home/4_perfil/perfil_paciente_page.dart';
import 'package:mobx/mobx.dart';

part '../stores/home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  int tabSelecionada = 0;

  @observable
  List<Widget> tabs = [
    const InicioPacientePage(),
    const ListaDosJogosPage(),
    const ArtigosPacientePage(),
    const NotificacoesPacientePage(),
    const PerfilPacientePage(),
  ];

  @action
  trocarTela(int posicao) {
    tabSelecionada = posicao;
  }
}
