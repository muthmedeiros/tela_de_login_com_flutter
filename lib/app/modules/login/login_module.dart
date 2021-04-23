import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:tela_de_login/app/modules/login/presentation/login_store.dart';

import 'domain/usecases/login_with_email.dart';
import 'presentation/login_page.dart';

class LoginModule extends ChildModule {
  static List<Bind> export = [
    Bind((i) => LoginRepositoryImpl(i<FirebaseAuth>())),
  ];


  @override
  List<Bind> get binds => [
        Bind((i) => LoginStore(i<LoginWithEmail>(), i<AuthStore>())),
        Bind((i) => LoginWithEmailImpl(i<LoginRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => LoginPage()),
      ];
}
