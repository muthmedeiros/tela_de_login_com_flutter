import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:tela_de_login/app/modules/login/presentation/login_store.dart';

import 'domain/usecases/login_with_email.dart';
import 'presentation/login_page.dart';

class LoginModule extends ChildModule {
  static List<Bind> export = [
    $LoginRepositoryImpl,
  ];

  @override
  List<Bind> get binds => [
        $LoginStore,
        $LoginWithEmailImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => LoginPage()),
      ];
}
