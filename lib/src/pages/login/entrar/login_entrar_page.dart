import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/pages/login/entrar/widgets/button_icon_widget.dart';
import '/src/pages/widgets/button_gradiente_widget.dart';
import '/src/pages/widgets/input_text_widget.dart';
import '/src/constants/constants_colors.dart';

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
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
            child: Container(
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                gradient: ConstantColor.linearColors,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/logo_sem_texto.png",
                    width: size.width * .53,
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    color: ConstantColor.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                    "Entre com seu email e senha ou use as redes sociais."),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputTextWidget(
                          labelInput: "Email",
                          entradaController: usuarioController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: ConstantColor.primaryColor,
                          ),
                          entradaTipo: TextInputType.emailAddress,
                          mostrarSenha: null,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.02),
                          child: InputTextWidget(
                            labelInput: "Senha",
                            entradaController: senhaController,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: ConstantColor.primaryColor,
                            ),
                            sufixIcon: mostrarSenha
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onPressIconSufix: () {
                              setState(() {
                                mostrarSenha = !mostrarSenha;
                              });
                            },
                            entradaTipo: TextInputType.visiblePassword,
                            mostrarSenha: mostrarSenha,
                          ),
                        ),
                        Hero(
                          tag: "btn_entrar",
                          child: ButtonGradienteWidget(
                            texto: "Entrar",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: size.width * .29,
                        color: ConstantColor.cinzaColor,
                      ),
                      const Text(
                        "Ou se preferir",
                        style: TextStyle(
                          fontSize: 12,
                          color: ConstantColor.cinzaTextColor,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: size.width * .29,
                        color: ConstantColor.cinzaColor,
                      ),
                    ],
                  ),
                ),
                const ButtonIconWidget(
                  pathImagem: "assets/images/logo_google.png",
                  texto: "Entrar com o Google",
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: const ButtonIconWidget(
                    pathImagem: "assets/images/logo_profissional.png",
                    texto: "Entrar como um profissional",
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Não possui conta?",
                      style: TextStyle(
                        fontSize: 13,
                        color: ConstantColor.cinzaTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(seconds: 1),
                              pageBuilder: (_, __, ___) =>
                                  const LoginCriarContaPage()),
                        );
                      },
                      child: const Text(
                        "Crie aqui!",
                        style: TextStyle(
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          color: ConstantColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
