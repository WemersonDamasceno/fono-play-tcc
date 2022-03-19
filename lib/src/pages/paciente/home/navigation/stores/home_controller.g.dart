// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$tabSelecionadaAtom = Atom(name: '_HomeController.tabSelecionada');

  @override
  int get tabSelecionada {
    _$tabSelecionadaAtom.reportRead();
    return super.tabSelecionada;
  }

  @override
  set tabSelecionada(int value) {
    _$tabSelecionadaAtom.reportWrite(value, super.tabSelecionada, () {
      super.tabSelecionada = value;
    });
  }

  final _$tabsAtom = Atom(name: '_HomeController.tabs');

  @override
  List<Widget> get tabs {
    _$tabsAtom.reportRead();
    return super.tabs;
  }

  @override
  set tabs(List<Widget> value) {
    _$tabsAtom.reportWrite(value, super.tabs, () {
      super.tabs = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic trocarTela(int posicao) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.trocarTela');
    try {
      return super.trocarTela(posicao);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabSelecionada: ${tabSelecionada},
tabs: ${tabs}
    ''';
  }
}
