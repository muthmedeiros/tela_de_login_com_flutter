import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home_page.dart';
import 'presentation/home_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => HomePage()),
      ];
}
