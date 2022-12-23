import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/home/navigation/home_navigation.dart';
import 'package:fonoplay/src/pages/screens_intro/view/introducao_page.dart';
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
            return IntroducaoPage();
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
