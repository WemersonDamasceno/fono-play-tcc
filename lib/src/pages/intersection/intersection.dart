import 'package:flutter/material.dart';
import 'package:fonoplay/src/utils/shared_preferences.dart';

class Intersection extends StatefulWidget {
  const Intersection({Key? key}) : super(key: key);

  @override
  State<Intersection> createState() => _IntersectionState();
}

class _IntersectionState extends State<Intersection> {
  late SharedPref sharedPref;
  bool hasToken = false;

  @override
  void initState() {
    super.initState();
    sharedPref = SharedPref();

    hasLoged();
  }

  hasLoged() async {
    var token = await sharedPref.read("token");
    hasToken = token != null;
    if (hasToken) {
      return Navigator.pushReplacementNamed(context, '/navigation_home_page');
    }
    return Navigator.pushReplacementNamed(context, '/introducao_pages');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
