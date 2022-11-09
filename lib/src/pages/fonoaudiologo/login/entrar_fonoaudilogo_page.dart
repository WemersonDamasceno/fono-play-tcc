import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonoplay/src/pages/paciente/login/entrar/login_entrar_page.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

import '/src/constants/constants_colors.dart';
import '/src/pages/widgets/button_gradiente_widget.dart';
import '/src/pages/widgets/input_text_widget.dart';

class EntrarFonoaudiologoPage extends StatefulWidget {
  const EntrarFonoaudiologoPage({Key? key}) : super(key: key);

  @override
  State<EntrarFonoaudiologoPage> createState() =>
      _EntrarFonoaudiologoPageState();
}

class _EntrarFonoaudiologoPageState extends State<EntrarFonoaudiologoPage> {
  final _formKey = GlobalKey<FormState>();
  final userFonoController = TextEditingController();
  final senhaFonoController = TextEditingController();
  final chaveSegurancaController = TextEditingController();
  bool mostrarSenha = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    userFonoController.dispose();
    senhaFonoController.dispose();
    chaveSegurancaController.dispose();
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
                      alignment: Alignment.center,
                      child: Card(
                        elevation: 6,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          "assets/images/medica_perfil.png",
                          width: size.width * 0.4,
                        ),
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
                    SizedBox(
                      width: size.width * 0.55,
                      child: const Text(
                        "Entre com os dados que foram repassados pela equipe do FonoPlay.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.42,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.02, left: 20, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextWidget(
                        labelInput: "Email",
                        entradaController: userFonoController,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: ConstantColor.primaryColor,
                        ),
                        entradaTipo: TextInputType.emailAddress,
                        mostrarSenha: null,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                        child: InputTextWidget(
                          labelInput: "Senha",
                          entradaController: senhaFonoController,
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
                      const Text(
                        "Digite os 3 digitos da sua chave de segurança.",
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: size.width * .53,
                            child: TextFormField(
                              controller: chaveSegurancaController,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                if (chaveSegurancaController.text.length >= 3) {
                                  chaveSegurancaController.text =
                                      chaveSegurancaController.text
                                          .substring(0, 3);
                                }
                              },
                              textAlign: TextAlign.end,
                              expands: false,
                              showCursor: false,
                              style: const TextStyle(
                                color: ConstantColor.startGradiente,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 33,
                              ),
                              decoration: const InputDecoration(
                                hintText: "***",
                                hintStyle: TextStyle(
                                  color: ConstantColor.startGradiente,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 40,
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Preencha este campo!";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * .55,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.14,
                                  height: 2,
                                  color: ConstantColor.startGradiente,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.14,
                                  height: 2,
                                  color: ConstantColor.startGradiente,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: size.width * 0.14,
                                  height: 2,
                                  color: ConstantColor.startGradiente,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.width * 0.377,
              left: size.width * 0.57,
              child: Image.asset(
                "assets/images/fono_explica.png",
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              top: size.height * 0.87,
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
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
