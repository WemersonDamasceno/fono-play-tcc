import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_snackbar.dart';
import 'package:fonoplay/src/pages/paciente/login/entrar/login_entrar_page.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';
import '/src/constants/constants_colors.dart';
import '/src/pages/widgets/button_gradiente_widget.dart';
import '/src/pages/widgets/input_text_widget.dart';
import '../dados_da_crianca/dados_da_crianca_page.dart';

class LoginCriarContaPage extends StatefulWidget {
  const LoginCriarContaPage({Key? key}) : super(key: key);

  @override
  State<LoginCriarContaPage> createState() => _LoginCriarContaPageState();
}

class _LoginCriarContaPageState extends State<LoginCriarContaPage> {
  final _formKey = GlobalKey<FormState>();
  final emailPacienteController = TextEditingController();
  final senhaPacienteController = TextEditingController();
  final nomePacienteController = TextEditingController();

  bool mostrarSenha = true;
  bool checkTermosUso = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailPacienteController.dispose();
    senhaPacienteController.dispose();
    nomePacienteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const ContainerGradienteWidget(),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => const LoginEntrarPage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/logo_sem_texto.png",
                        width: size.width * 0.46,
                      ),
                    ),
                    const Text(
                      "Criar Conta",
                      style: TextStyle(
                        color: ConstantColor.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text("Crie uma conta, é rápido e fácil."),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputTextWidget(
                              labelInput: "Nome",
                              entradaController: nomePacienteController,
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: ConstantColor.primaryColor,
                              ),
                              entradaTipo: TextInputType.text,
                              mostrarSenha: null,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              child: InputTextWidget(
                                labelInput: "Email",
                                entradaController: emailPacienteController,
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: ConstantColor.primaryColor,
                                ),
                                entradaTipo: TextInputType.emailAddress,
                                mostrarSenha: null,
                              ),
                            ),
                            InputTextWidget(
                              labelInput: "Senha",
                              entradaController: senhaPacienteController,
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
                            //Termos de uso
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        value: checkTermosUso,
                                        onChanged: (value) {
                                          setState(() {
                                            checkTermosUso = value!;
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              'Ao se inscrever, você concorda com\nnossos ',
                                          style: const TextStyle(
                                              color:
                                                  ConstantColor.descricaoColor,
                                              fontSize: 15),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'termos de uso.',
                                              style: const TextStyle(
                                                  color: ConstantColor
                                                      .primaryColor,
                                                  fontSize: 15),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.85,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Hero(
                    tag: "btn_entrar",
                    child: ButtonGradienteWidget(
                      habilitarBotao: true,
                      texto: "Continuar",
                      onPressed: () {
                        if (checkTermosUso) {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(seconds: 1),
                                    pageBuilder: (_, __, ___) =>
                                        const DadosDaCriancaPage()));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              ConstantsSnackBar.snackBarWidget(
                                  "Aceite os termos para continuar!",
                                  Icons.warning_amber_rounded));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getColor(Set<MaterialState> states) {
  return ConstantColor.primaryColor;
}
