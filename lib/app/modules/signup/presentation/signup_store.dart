import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';
import 'package:tela_de_login/app/modules/signup/domain/entities/signup_validator.dart';
import 'package:tela_de_login/app/modules/signup/domain/usecases/signup.dart';

part 'signup_store.g.dart';

@Injectable()
class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  final Signup signupUseCase;
  final AuthStore authStore;

  _SignupStore(this.signupUseCase, this.authStore);

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String uid = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setName(String value) => name = value;

  @action
  void setUid(String value) => uid = value;

  @computed
  SignupValidator get signupValidator => SignupValidator.withData(
        name: name,
        email: email,
        password: password,
        uid: uid,
      );

  signup() async {
    await Future.delayed(Duration(milliseconds: 500));
    var result = await signupUseCase(signupValidator);
    result.fold((failure) {
      asuka.showDialog(
        builder: (context) => AlertDialog(
          title: Text(failure.message),
        ),
      );
    }, (user) {
      authStore.setUser(
          user); //set the user to get the uid on the address module (logout after completing the address registration)
      Modular.to.pushNamedAndRemoveUntil("/address", (_) => false);
    });
  }
}
