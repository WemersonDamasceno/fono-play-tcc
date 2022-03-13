import 'package:flutter/material.dart';
import 'src/pages/login/criar_conta/criar_conta_page.dart';
import 'src/pages/login/entrar/login_entrar_page.dart';
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
      home: const LoginEntrarPage(),
      initialRoute: '/',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/introducao_pages': (context) => const IntroducaoPage(),
        '/login_entrar': (context) => const LoginEntrarPage(),
        '/login_criar_conta': (context) => const LoginCriarContaPage(),
      },
    );
  }
}
