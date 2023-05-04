import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fonoplay/firebase_options.dart';
import 'package:fonoplay/src/pages/games/0_jogo_da_memoria/pages/jogo_da_memoria_page.dart';
import 'package:fonoplay/src/pages/games/1_conhecendo_animais/pages/conhecendo_os_animais_page.dart';
import 'package:fonoplay/src/pages/games/2_jogo_das_cores/page/jogo_das_cores_page.dart';
import 'package:fonoplay/src/pages/games/3_toque_para_falar/toque_falar_page.dart';
import 'package:fonoplay/src/pages/home/1_jogos/list_jogos_page.dart';
import 'package:fonoplay/src/pages/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/intersection/intersection.dart';
import 'package:fonoplay/src/pages/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'package:fonoplay/src/pages/login/entrar/login_entrar_page.dart';
import 'package:fonoplay/src/pages/screens_intro/view/introducao_page.dart';
import 'package:fonoplay/src/services/auth-service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => AuthServiceNotifier(FirebaseAuth.instance)),
    ],
    child: const MyApp(),
  ));
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
      home: const NavigationHomePage(),
      initialRoute: '/',
      routes: {
        '/intersection': (context) => const Intersection(),
        '/navigation_home_page': (context) => NavigationHomePage(),
        '/introducao_pages': (context) => const IntroducaoPage(),
        '/login_entrar': (context) => const LoginEntrarPage(),
        '/login_criar_conta': (context) => const LoginCriarContaPage(),
        '/home': (context) => const NavigationHomePage(),
        '/lista_de_jogos': (context) => ListaDosJogosPage(),
        '/jogo_da_memoria': (context) => const JogoDaMemoriaPage(),
        '/jogo_da_imitacao': (context) => const ConhecendoOsAnimaisPage(),
        '/jogo_das_cores': (context) => const JogoDasCoresPage(),
        '/toque-para-falar': (context) => const ToqueParaFalarPage(),
      },
    );
  }
}
