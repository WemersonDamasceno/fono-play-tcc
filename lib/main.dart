import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/pages/paciente/home/navigation/home_navigation.dart';
import 'src/pages/paciente/login/criar_conta/dados_do_responsavel/criar_conta_page.dart';
import 'src/pages/paciente/login/entrar/login_entrar_page.dart';
import 'src/pages/screens_intro/view/introducao_page.dart';
import 'src/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
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
        '/introducao_pages': (context) => const IntroducaoPage(),
        '/login_entrar': (context) => const LoginEntrarPage(),
        '/login_criar_conta': (context) => const LoginCriarContaPage(),
        '/home': (context) => const NavigationHomePage(),
      },
    );
  }
}
