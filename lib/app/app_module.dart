import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'core/pages/splash_screen_page.dart';
import 'core/stores/auth_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/domain/usecases/get_logged_user.dart';
import 'modules/login/domain/usecases/logout.dart';
import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthStore(i<GetLoggedUser>(), i<Logout>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => SplashScreenPage()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
