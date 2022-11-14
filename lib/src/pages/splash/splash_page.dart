import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  mudarCorStatusBar(Color corStatusBar) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: corStatusBar,
      ),
    );
  }

  void navigationPage() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pushNamed(context, "/intersection");
  }

  @override
  void initState() {
    super.initState();
    mudarCorStatusBar(Colors.transparent);
    Future.delayed(Duration(seconds: 2), () => navigationPage());
  }

  @override
  void dispose() {
    Future.delayed(Duration.zero);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: ConstantColor.linearColors,
        ),
        child: Center(
          child: SizedBox(
            width: size.width * .6,
            child: Image.asset("assets/images/logo_fonoplay.png"),
          ),
        ),
      ),
    );
  }
}
