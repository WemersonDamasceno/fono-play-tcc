import 'package:flutter/material.dart';
import '/src/constants/constants_colors.dart';
import '/src/pages/login/widgets/input_text_widget.dart';

class LoginEntrarPage extends StatefulWidget {
  const LoginEntrarPage({Key? key}) : super(key: key);

  @override
  State<LoginEntrarPage> createState() => _LoginEntrarPageState();
}

class _LoginEntrarPageState extends State<LoginEntrarPage> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  bool mostrarSenha = true;
  bool habilitarBotao = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usuarioController.dispose();
    senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/logo_sem_texto.png",
                width: size.width * .55,
              ),
            ),
            const Text("Login"),
            const Text("Entre com seu email e senha ou use as redes sociais."),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputTextWidget(
                    labelInput: "Email",
                    entradaController: usuarioController,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: ConstantColor.primaryColor,
                    ),
                    entradaTipo: TextInputType.emailAddress,
                    mostrarSenha: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
