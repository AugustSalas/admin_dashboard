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

    static showSnackbar(String msj) {
    final snackbar = SnackBar(
      content: Text(
        msj,
        style: const TextStyle(color: Colors.white,fontSize: 20),
      ),
    );

    msjKey.currentState!.showSnackBar(snackbar);
  }

  static showBusyIndicator(BuildContext context){

    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: ( _ ) => dialog);
  }
}
