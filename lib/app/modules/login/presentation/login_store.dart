import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';
import 'package:tela_de_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'login_store.g.dart';

@Injectable()
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginWithEmail loginWithEmail;
  final AuthStore authStore;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  _LoginStore(this.loginWithEmail, this.authStore, {this.email, this.password});

  enterLoginEmail() async {
    await Future.delayed(Duration(milliseconds: 500));
    var result = await loginWithEmail(email, password);
    result.fold((failure) {
      changeErrorStatus();
      asuka.showSnackBar(SnackBar(
          content: Text(failure.message), duration: Duration(seconds: 2)));
    }, (user) {
      authStore.setUser(user);
      Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
    });
  }

  @observable
  bool credentialError = false;

  @action
  void changeErrorStatus() {
    credentialError = !credentialError;
  }
}
