import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tela_de_login/app/app_module.dart';
import 'package:tela_de_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:tela_de_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:tela_de_login/app/modules/login/domain/usecases/logout.dart';
import 'package:tela_de_login/app/modules/login/login_module.dart';
import '../../../mock-firebase.dart';

main() async {

  initModules([
    AppModule(),
    LoginModule(),
  ]);

  setUpAll(() async {
    setupCloudFirestoreMocks();
    await Firebase.initializeApp();
  });

  test("should get usecase LoginWithEmailGoogle", () {
    final usecase = Modular.get<LoginWithEmail>();
    expect(usecase, isA<LoginWithEmailImpl>());
  });

  test("should get usecase GetLoggedUser", () {
    final usecase = Modular.get<GetLoggedUser>();
    expect(usecase, isA<GetLoggedUserImpl>());
  });

  test("should get usecase Logout", () {
    final usecase = Modular.get<Logout>();
    expect(usecase, isA<LogoutImpl>());
  });
}
