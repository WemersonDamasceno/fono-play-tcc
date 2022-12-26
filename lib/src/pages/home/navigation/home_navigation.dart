import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/home/navigation/controllers/home_controller.dart';
import 'package:fonoplay/src/services/auth-service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final homeController = HomeController();

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  late AudioPlayer _player;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setVolume(0.1);
    _player.onPlayerComplete.listen((event) {
      _player.play(AssetSource("audios/musica_background.mp3"));
    });
    _player.play(AssetSource("audios/musica_background.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    String withoutProfilePhoto = "https://www.wikiaves.com.br/img/semfoto.png";
    String imageUser = context.watch<AuthServiceNotifier>().user?.photoURL ??
        withoutProfilePhoto;

    return Scaffold(
      body: Observer(
        builder: (_) {
          return homeController.tabs[homeController.tabSelecionada];
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(gradient: AppColors.linearColors),
              accountEmail: Text(
                context.watch<AuthServiceNotifier>().user?.email ??
                    "wemersondamasceno@gmail.com",
                style: TextStyle(fontSize: 12),
              ),
              accountName: Text(
                context.watch<AuthServiceNotifier>().user?.displayName ??
                    "Wemerson Damasceno",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              otherAccountsPictures: [
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.music_note : Icons.music_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isPlaying) {
                        _player.pause();
                        isPlaying = false;
                      } else {
                        _player
                            .play(AssetSource("audios/musica_background.mp3"));
                        isPlaying = true;
                      }
                    });
                  },
                ),
              ],
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imageUser),
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
                final Uri uri = Uri(scheme: 'https', host: 'apraxiabrasil.org');

                await launchUrl(
                  uri,
                  mode: LaunchMode.inAppWebView,
                  webViewConfiguration: WebViewConfiguration(
                    enableJavaScript: true,
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.person,
            //     color: AppColors.startGradiente,
            //   ),
            //   title: const Text("Dados da criança"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     homeController.trocarTela(ConstantesPaginas.PERFIL_DA_CRIANCA);
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.notifications,
            //     color: AppColors.startGradiente,
            //   ),
            //   title: const Text("Notificações"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     homeController.trocarTela(ConstantesPaginas.NOTIFICACOES);
            //   },
            // ),
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
                              "Desenvolvido por Wemerson Damasceno",
                        ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.startGradiente,
              ),
              title: const Text("Sair"),
              onTap: () async {
                await Provider.of<AuthServiceNotifier>(context, listen: false)
                    .logout(context: context);
                Navigator.of(context).pushReplacementNamed('/login_entrar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
