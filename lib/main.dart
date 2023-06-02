import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fonoplay/src/pages/games/0_jogo_da_memoria/pages/jogo_da_memoria_page.dart';
import 'package:fonoplay/src/pages/games/1_encontre_os_animais/pages/encontre_os_animais_page.dart';
import 'package:fonoplay/src/pages/games/3_jogo_das_cores/page/jogo_das_cores_page.dart';
import 'package:fonoplay/src/pages/games/5_jogo_dos_fonemas/lista_dos_fonemas_page.dart';
import 'package:fonoplay/src/pages/games/toque_para_falar/toque_falar_page.dart';
import 'package:fonoplay/src/pages/home/1_jogos/list_jogos_page.dart';
import 'package:fonoplay/src/pages/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/intersection/intersection.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_da_crianca/dados_da_crianca_page.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/pages/screens_intro/view/introducao_page.dart';
import 'package:fonoplay/src/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FonoPlay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.green,
      ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      home: const SplashPage(),
      initialRoute: '/',
      routes: {
        '/intersection': (context) => Intersection(),
        '/navigation_home_page': (context) => NavigationHomePage(),
        '/introducao_pages': (context) => const IntroducaoPage(),
        '/dados_da_crianca': (context) => DadosDaCriancaPage(
              email: '',
              senha: '',
              nome: '',
            ),
        '/login_criar_conta': (context) => const LoginCriarContaPage(),
        '/home': (context) => const NavigationHomePage(),
        '/lista_de_jogos': (context) => ListaDosJogosPage(),
        '/jogo_da_memoria': (context) => const JogoDaMemoriaPage(),
        '/jogo_da_imitacao': (context) => const ConhecendoOsAnimaisPage(),
        '/jogo_das_cores': (context) => const JogoDasCoresPage(),
        '/toque-para-falar': (context) => const ToqueParaFalarPage(),
        '/jogo-dos-fonemas': (context) => const ListaDosFonemasPage(),
      },
    );
  }
}
