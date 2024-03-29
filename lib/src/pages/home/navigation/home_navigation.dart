import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/home/navigation/controllers/home_controller.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/utils/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final homeController = HomeController();

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  late AudioPlayer _player;
  bool isPlaying = false;

  late SharedPref sharedPref;
  String nameUser = '';
  String emailUser = '';

  @override
  void initState() {
    super.initState();
    sharedPref = SharedPref();
    _player = AudioPlayer();
    _player.setVolume(0.04);
    _player.onPlayerComplete.listen((event) {
      _player.play(
        AssetSource("audios/musica_background.mp3"),
        volume: 0.04,
      );
    });
    if (isPlaying)
      _player.play(
        AssetSource("audios/musica_background.mp3"),
        volume: 0.04,
      );

    getUserData();
  }

  getUserData() async {
    nameUser = await sharedPref.read('nameUser') ?? 'Não definido';
    emailUser = await sharedPref.read('emailUser') ?? 'Não definido';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String withoutProfilePhoto = "https://www.wikiaves.com.br/img/semfoto.png";

    return WillPopScope(
      onWillPop: () async {
        homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL);
        return false;
      },
      child: Scaffold(
        body: Observer(
          builder: (_) {
            return homeController.tabs[homeController.tabSelecionada];
          },
        ),
        floatingActionButton: Tooltip(
          message: "Parar ou tocar a música de fundo",
          child: FloatingActionButton(
            backgroundColor: AppColors.endGradiente,
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  _player.pause();
                  isPlaying = false;
                } else {
                  _player.play(
                    AssetSource("audios/musica_background.mp3"),
                    volume: 0.04,
                  );
                  isPlaying = true;
                }
              });
            },
            child: Icon(
              isPlaying ? Icons.music_note : Icons.music_off,
            ),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration:
                    const BoxDecoration(gradient: AppColors.linearColors),
                accountEmail: Text(
                  emailUser,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                accountName: Text(
                  nameUser,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(withoutProfilePhoto),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text("Funcionalidades",
                    style: TextStyle(
                      color: AppColors.cinzaTextColor,
                      fontSize: 16,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: AppColors.startGradiente,
                ),
                title: const Text("Pagina Inicial"),
                onTap: () {
                  Navigator.pop(context);
                  homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.auto_stories,
                  color: AppColors.startGradiente,
                ),
                title: const Text("Artigos para ler"),
                onTap: () async {
                  _player.pause();
                  final Uri uri =
                      Uri(scheme: 'https', host: 'apraxiabrasil.org');

                  await launchUrl(
                    uri,
                    mode: LaunchMode.inAppWebView,
                    webViewConfiguration: WebViewConfiguration(
                      enableJavaScript: true,
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text("Outras opções",
                    style: TextStyle(
                      color: AppColors.cinzaTextColor,
                      fontSize: 16,
                    )),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.email_rounded,
                  color: AppColors.startGradiente,
                ),
                title: const Text("Envie suas sugestões"),
                onTap: () async {
                  _player.pause();
                  String email = "wemersondamasceno7@gmail.com";
                  String subject = "Sugestões para o FonoPlay";
                  String body =
                      "Olá Wemerson!\nGostaria de sugerir o seguinte:\n 1- ";
                  final url =
                      'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

                  await launchUrl(Uri.parse(url));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: AppColors.startGradiente,
                ),
                title: const Text("Sobre o FonoPlay"),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AboutDialog(
                      applicationName: "FonoPlay",
                      applicationVersion: "1.0.0",
                      applicationIcon: Image.asset(
                        "assets/images/logo_fonoplay.png",
                        height: 80,
                        width: 80,
                      ),
                      applicationLegalese:
                          "Desenvolvido por Wemerson Damasceno\nAudios: Maiara Couto",
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.startGradiente,
                ),
                title: const Text("Sair"),
                onTap: () async {
                  _player.pause();
                  sharedPref.remove('nameUser');
                  sharedPref.remove('emailUser');
                  sharedPref.remove('token');
                  sharedPref.remove('avatarKid');
                  sharedPref.remove('nameKid');
                  sharedPref.remove('dataNascimentoKid');

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => LoginCriarContaPage(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
