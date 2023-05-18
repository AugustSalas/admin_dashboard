

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

   GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  //  final AuthProvider authProvider;

    String email = '';
    String password = '';

  // LoginFormProvider(this.authProvider);

  bool  validateForm(){

      if(formKey.currentState!.validate() ) {
        // print('Form valid');
        // print('$email --- $password');
        // authProvider.login(email, password);
        return true;
      }else{
        // print('Form not valid');
        return false;
      }

    }


}