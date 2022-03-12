import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

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

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.popAndPushNamed(context, "/introducao_pages");
  }

  @override
  void initState() {
    super.initState();
    mudarCorStatusBar(Colors.transparent);
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
