import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';

import 'presentation/home_page.dart';
import 'presentation/home_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeStore(i<AuthStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => HomePage()),
      ];
}
