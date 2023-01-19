import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:todomobx/screens/list_screen.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();
  late ReactionDisposer disposer;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ListScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

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
                    Observer(
                      builder: (_) => Opacity(
                        opacity: loginStore.loading ? .5 : 1,
                        child: CustomTextField(
                          controller: emailController,
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                          enabled: !loginStore.loading,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) => Opacity(
                        opacity: loginStore.loading ? .5 : 1,
                        child: CustomTextField(
                          controller: passwordController,
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: loginStore.obscurePassword,
                          onChanged: loginStore.setPassword,
                          enabled: !loginStore.loading,
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
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2.25,
                          fixedSize: Size(150, 44),
                        ),
                        onPressed: loginStore.loginPressed,
                        child: loginStore.loading
                            ? SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.25,
                                ))
                            : Text('Login'),
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
