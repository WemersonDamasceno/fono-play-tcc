import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_snackbar.dart';

class DadosDaCriancaMixin {
  atualizarDadosDaCrianca({
    required GlobalKey<FormState> formKey,
    required TextEditingController dataNascimentoController,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      if (dataNascimentoController.text != "Data de nascimento") {
        Navigator.popAndPushNamed(context, "/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            ConstantsSnackBar.snackBarWidget("Escolha uma data de nascimento.",
                Icons.warning_amber_rounded));
      }
    }
  }
}
