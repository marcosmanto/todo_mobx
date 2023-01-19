import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      controller: emailController,
                      hint: 'E-mail',
                      prefix: Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) => CustomTextField(
                        controller: passwordController,
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: loginStore.obscurePassword,
                        onChanged: loginStore.setPassword,
                        enabled: true,
                        suffix: CustomIconButton(
                          iconColor: loginStore.obscurePassword
                              ? Color(0xFF818480)
                              : null,
                          radius: 32,
                          iconData: Icons.visibility,
                          /*loginStore.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,*/
                          onTap: loginStore.toggleObscurePassword,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (_) => ElevatedButton(
                          onPressed: loginStore.isFormValid
                              ? () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => ListScreen()));
                                }
                              : null,
                          child: Text('Login'),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
