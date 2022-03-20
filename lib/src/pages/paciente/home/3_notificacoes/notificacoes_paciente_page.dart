import 'package:flutter/material.dart';

class NotificacoesPacientePage extends StatelessWidget {
  const NotificacoesPacientePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return const Text("Notificacoes");
        },
      ),
    );
  }
}
