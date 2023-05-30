import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          color: Colors.black,
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su nombre';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.registerInputDecoration(
                        hint: 'Ingrese su nombre',
                        icon: Icons.person,
                        label: 'Nombre',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no valido';
                        }
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.registerInputDecoration(
                        hint: 'Ingrese su correo',
                        icon: Icons.email_outlined,
                        label: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe de ser de 6 caracteres';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.registerInputDecoration(
                        hint: '*********',
                        icon: Icons.lock_outline_rounded,
                        label: 'Contraseña',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomOutlinedButton(
                      onPressed: () {
                        final validForm = registerFormProvider.validateForm();
                        if (!validForm) return;

                        final authProvider =
                            Provider.of<AuthProvider>(context, listen: false);
                        authProvider.register(
                          registerFormProvider.email,
                          registerFormProvider.password,
                          registerFormProvider.name,
                        );
                      },
                      text: 'Crear Cuenta',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(
                      text: 'Ir a login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
