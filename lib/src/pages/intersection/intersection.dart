import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/paciente/login/entrar/login_entrar_page.dart';
import 'package:fonoplay/src/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

import '../../services/auth-service.dart';

class Intersection extends StatelessWidget {
  const Intersection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<AuthServiceNotifier>().currentUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (snapshot.connectionState == ConnectionState.active &&
              !snapshot.hasData) {
            return LoginEntrarPage();
          }
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return NavigationHomePage();
          }
          return (Scaffold(
            body: Center(
              child: Text("Error Page"),
            ),
          ));
        });
  }
}
