import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> msjKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String msj) {
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        msj,
        style: const TextStyle(color: Colors.white,fontSize: 20),
      ),
    );

    msjKey.currentState!.showSnackBar(snackbar);
  }
}
