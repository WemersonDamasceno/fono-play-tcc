import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fonoplay/src/pages/intersection/intersection.dart';
import 'package:fonoplay/src/pages/paciente/games/1_jogo_da_imitacao/pages/jogo_da_imitacao_page.dart';
import 'package:fonoplay/src/services/auth-service.dart';
import 'package:provider/provider.dart';

import 'src/pages/paciente/games/0_jogo_da_memoria/pages/jogo_da_memoria_page.dart';
import 'src/pages/paciente/home/navigation/home_navigation.dart';
import 'src/pages/paciente/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'src/pages/paciente/login/entrar/login_entrar_page.dart';
import 'src/pages/screens_intro/view/introducao_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      home: const Intersection(),
      initialRoute: '/',
      routes: {
        '/navigation_home_page': (context) => NavigationHomePage(),
        '/introducao_pages': (context) => const IntroducaoPage(),
        '/login_entrar': (context) => const LoginEntrarPage(),
        '/login_criar_conta': (context) => const LoginCriarContaPage(),
        '/home': (context) => const NavigationHomePage(),
        '/jogo_da_memoria': (context) => const JogoDaMemoriaPage(),
        '/jogo_da_imitacao': (context) => const JogoDaImitacaoPage(),
      },
    );
  }
}
