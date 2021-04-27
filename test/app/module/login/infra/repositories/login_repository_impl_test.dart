import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:tela_de_login/app/modules/login/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

main() {
  final firebaseAuth = FirebaseAuthMock();
  final userCredential = UserCredentialMock();
  final user = UserMock();
  final repository = LoginRepositoryImpl(firebaseAuth);

  setUpAll(() {
    when(firebaseAuth.signInWithEmailAndPassword(
    email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => userCredential);
    when(userCredential.user).thenReturn(user);
    when(user.email).thenReturn("teste@teste.com");
    when(user.uid).thenReturn("teste123");
  });

  group("loginEmail", () {
    test('should get UserModel', () async {
      var result = await repository.loginEmail(
          email: "teste@teste.com", password: "12345678");
      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
      expect(result.fold(id, (user) => user.uid), "teste123");
      expect(result.fold(id, (user) => user.email), "teste@teste.com");
    });
    test('should call ErrorLoginEmail', () async {
      when(firebaseAuth.signInWithEmailAndPassword(
              email: "teste@teste.com", password: "12345678"))
          .thenThrow(Exception());
      var result = await repository.loginEmail(
          email: "teste@teste.com", password: "12345678");
      expect(result.leftMap((l) => l is ErrorLoginEmail), Left(true));
      expect(result.fold((l) => l.message, id), Messages.FAILED_TO_LOGIN);
    });
  });
}
