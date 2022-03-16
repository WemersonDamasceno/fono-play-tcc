import 'package:flutter/material.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/pages/paciente/home/1_inicio/inicio_paciente_page.dart';
import 'package:fonoplay/src/pages/paciente/home/2_artigos/artigos_paciente_page.dart';
import 'package:fonoplay/src/pages/paciente/home/3_notificacoes/notificacoes_paciente_page.dart';
import 'package:fonoplay/src/pages/paciente/home/4_perfil/perfil_paciente_page.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  int tabSelecionada = 0;

  final tabs = [
    const InicioPacientePage(),
    const ArtigosPacientePage(),
    const NotificacoesPacientePage(),
    const PerfilPacientePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[tabSelecionada],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabSelecionada,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: ConstantColor.startGradiente,
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Artigos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: "Notificações",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        onTap: (index) {
          setState(() {
            tabSelecionada = index;
          });
        },
      ),
    );
  }
}
