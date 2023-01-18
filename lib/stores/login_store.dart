import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print(email);
      print(password);
    });
  }

  @observable
  String email = '';
  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;
}
