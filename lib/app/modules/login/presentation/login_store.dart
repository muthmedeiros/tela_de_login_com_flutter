import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';

part 'login_store.g.dart';

@Injectable()
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthStore auth;

  _LoginStore(this.auth);

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool credentialError = false;

  @action
  void changeErrorStatus() {
    credentialError = !credentialError;
  }

  Future loginWithEmail() async {
    bool result;
    result = await auth.login(email, password, credentialError);
    if(!result) changeErrorStatus();
  }
}
