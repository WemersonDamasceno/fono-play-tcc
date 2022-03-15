import 'package:flutter/material.dart';

class ConstantsSnackBar {
  static snackBarWidget(String mensagem, IconData icon) {
    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            mensagem,
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
