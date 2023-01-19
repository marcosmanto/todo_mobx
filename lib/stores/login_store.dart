import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      //print(email);
      //print(password);
      //print('Password valid: $isPasswordValid\nEmail valid: $isEmailValid');
      print('Form valid: $isFormValid');
    });
  }

  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool obscurePassword = true;
  @observable
  bool loading = false;

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;
  @action
  void toggleObscurePassword() => obscurePassword = !obscurePassword;
  @action
  Future<void> login() async {
    loading = true;

    // processar o login
    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }

  @computed
  bool get isPasswordValid => password.length > 6;
  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);
  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
