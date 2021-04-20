import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  FirebaseAuth user;

  @action
  void setUser() => user = auth;

  Future login(String email, String password, bool credentialError) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      setUser();
      Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
    } catch (e) {
      if (credentialError == false) return false;
    }
  }

  Future logout() async {
    await auth.signOut();
    setUser();
    Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
  }
}
