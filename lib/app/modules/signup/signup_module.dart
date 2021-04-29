import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/modules/signup/domain/usecases/signup.dart';
import 'package:tela_de_login/app/modules/signup/infra/repositories/signup_repository.dart';
import 'package:tela_de_login/app/modules/signup/presentation/signup_page.dart';
import 'package:tela_de_login/app/modules/signup/presentation/signup_store.dart';

class SignupModule extends ChildModule {
  static List<Bind> export = [
    $SignupRepositoryImpl,
  ];

  @override
  List<Bind> get binds => [
        $SignupStore,
        $SignupImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => SignupPage()),
      ];
}
