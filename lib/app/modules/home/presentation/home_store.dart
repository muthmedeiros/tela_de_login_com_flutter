import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final AuthStore auth;

  _HomeStore(this.auth);

  @action
  Future logoutAuth() async {
    await auth.logout();
  }
}
