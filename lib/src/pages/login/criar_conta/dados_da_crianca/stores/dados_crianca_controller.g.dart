// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/dados_crianca_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerDadosCrianca on _ControllerDadosCrianca, Store {
  final _$avatarAtom = Atom(name: '_ControllerDadosCrianca.avatar');

  @override
  int get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(int value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  final _$pathImageAtom = Atom(name: '_ControllerDadosCrianca.pathImage');

  @override
  String get pathImage {
    _$pathImageAtom.reportRead();
    return super.pathImage;
  }

  @override
  set pathImage(String value) {
    _$pathImageAtom.reportWrite(value, super.pathImage, () {
      super.pathImage = value;
    });
  }

  final _$_ControllerDadosCriancaActionController =
      ActionController(name: '_ControllerDadosCrianca');

  @override
  dynamic mudarImage(int novoAvatar) {
    final _$actionInfo = _$_ControllerDadosCriancaActionController.startAction(
        name: '_ControllerDadosCrianca.mudarImage');
    try {
      return super.mudarImage(novoAvatar);
    } finally {
      _$_ControllerDadosCriancaActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
avatar: ${avatar},
pathImage: ${pathImage}
    ''';
  }
}
