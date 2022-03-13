import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/pages/widgets/button_gradiente_widget.dart';
import 'package:fonoplay/src/pages/widgets/input_text_widget.dart';
import 'controllers/dados_crianca_controller.dart';
import 'widgets/escolha_avatars_widget.dart';

final controllerCrianca = ControllerDadosCrianca();

class DadosDaCriancaPage extends StatefulWidget {
  const DadosDaCriancaPage({Key? key}) : super(key: key);
  @override
  State<DadosDaCriancaPage> createState() => _DadosDaCriancaPageState();
}

class _DadosDaCriancaPageState extends State<DadosDaCriancaPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeCriancaController = TextEditingController();
  final dataNascimentoController = TextEditingController();
  String sintomasDropMenu = "Nenhum desses sintomas";

  @override
  void initState() {
    super.initState();
    dataNascimentoController.text = "Data de nascimento";
  }

  @override
  void dispose() {
    super.dispose();
    dataNascimentoController.dispose();
    nomeCriancaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  gradient: ConstantColor.linearColors,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) =>
                            const LoginCriarContaPage()),
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
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: size.height * 0.12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dados da criança",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: InkWell(
                        onTap: () {
                          configurandoModalBottomSheet(context);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.21,
                                width: size.width * 0.44,
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Hero(
                                    tag: "avatar",
                                    child: Observer(
                                      builder: (_) => Image.asset(
                                          controllerCrianca.pathImage),
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                "Toque para escolher o avatar",
                                style: TextStyle(
                                  color: ConstantColor.cinzaColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextWidget(
                              labelInput: "Nome",
                              entradaController: nomeCriancaController,
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: ConstantColor.primaryColor,
                              ),
                              entradaTipo: TextInputType.text,
                              mostrarSenha: null,
                            ),
                            inputCalendario(size),
                            const Text(
                              "Selecione uma opção abaixo.",
                              style: TextStyle(
                                color: ConstantColor.cinzaTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.only(left: 20),
                              height: size.height * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ConstantColor.startGradiente,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(7)),
                              ),
                              child: DropdownButton<String>(
                                value: sintomasDropMenu,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: ConstantColor.startGradiente,
                                ),
                                elevation: 16,
                                style: const TextStyle(
                                    color: ConstantColor.startGradiente),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    sintomasDropMenu = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Nenhum desses sintomas',
                                  'Autismo',
                                  'Sindrome de down',
                                  'Dislexia',
                                  'Atraso na fala',
                                  'Apraxia da fala'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "Poppins"),
                                    ),
                                  );
                                }).toList(),
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
                      texto: "Criar conta",
                      onPressed: () {},
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

  Widget inputCalendario(Size size) {
    return InkWell(
      onTap: () async {
        mostrarCalendario();
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Container(
            height: size.height * 0.07,
            decoration: BoxDecoration(
              border: Border.all(
                color: ConstantColor.startGradiente,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(7)),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: ConstantColor.primaryColor,
                  ),
                ),
                Text(
                  dataNascimentoController.text,
                  style: const TextStyle(
                    color: ConstantColor.startGradiente,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void mostrarCalendario() async {
    final data = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.input,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (data != null) {
      List<String> dataPt = data.toString().split(" ");
      List<String> dataConvert = dataPt[0].split("-");
      setState(() {
        dataNascimentoController.text =
            dataConvert[2] + "/" + dataConvert[1] + "/" + dataConvert[0];
      });
    }
  }

  void configurandoModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return const EscolherAvatarWidget();
        });
  }
}
