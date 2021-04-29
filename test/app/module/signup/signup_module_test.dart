import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tela_de_login/app/app_module.dart';
import 'package:tela_de_login/app/modules/signup/domain/usecases/signup.dart';
import 'package:tela_de_login/app/modules/signup/signup_module.dart';

import '../../../mock-firebase.dart';

main() async {
  initModules([
    AppModule(),
    SignupModule(),
  ]);

  setUpAll(() async {
    setupCloudFirestoreMocks();
    await Firebase.initializeApp();
  });

  test("should get usecase Signup", () {
    final usecase = Modular.get<Signup>();
    expect(usecase, isA<SignupImpl>());
  });
}
