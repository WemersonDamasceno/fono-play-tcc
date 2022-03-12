import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class InputTextWidget extends StatelessWidget {
  final TextEditingController entradaController;
  final TextInputType entradaTipo;
  final Color? color;
  final Color? corText;
  final bool? mostrarSenha;
  final String labelInput;
  final IconData? sufixIcon;
  final Widget prefixIcon;
  final GestureTapCallback? onPressIconSufix;
  final GestureTapCallback? onPressIconPrefix;

  const InputTextWidget({
    Key? key,
    required this.labelInput,
    required this.entradaController,
    required this.entradaTipo,
    required this.mostrarSenha,
    required this.prefixIcon,
    this.onPressIconSufix,
    this.sufixIcon,
    this.onPressIconPrefix,
    this.color,
    this.corText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: mostrarSenha ?? false,
      controller: entradaController,
      style: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.02,
      ),
      keyboardType: entradaTipo,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(right: -size.width * 0.05),
        labelText: labelInput,
        labelStyle: const TextStyle(
          color: ConstantColor.primaryColor,
        ),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ConstantColor.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ConstantColor.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: Icon(
            sufixIcon,
            color: ConstantColor.primaryColor,
          ),
          onPressed: onPressIconSufix,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Preencha este campo!";
        }
        //Se for email, verificar se possui mais de 6 caracteres!
        if (entradaTipo.toString() ==
                TextInputType.visiblePassword.toString() &&
            value.length < 6) {
          return "A senha deve ter no minimo 6 digitos!";
        }

        return null;
      },
    );
  }
}
