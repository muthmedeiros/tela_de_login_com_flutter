import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/signup/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/signup/infra/models/signup_user_model.dart';
import 'package:tela_de_login/app/modules/signup/infra/repositories/signup_repository.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

main() {
  final firebaseAuth = FirebaseAuthMock();
  final userCredential = UserCredentialMock();
  final user = UserMock();
  final repository = SignupRepositoryImpl(firebaseAuth);

  setUpAll(() {
    when(firebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => userCredential);
    when(userCredential.user).thenReturn(user);
    when(user.email).thenReturn("teste@teste.com");
    when(user.uid).thenReturn("teste123");
  });

  group("loginEmail", () {
    test('should get SignupUserModel', () async {
      var result = await repository.signUp(
          name: "teste", email: "teste@teste.com", password: "12345678");
      expect(result, isA<Right<dynamic, SignupUserModel>>());
      expect(result.fold(id, (user) => user.name), "teste");
      expect(result.fold(id, (user) => user.uid), "teste123");
      expect(result.fold(id, (user) => user.email), "teste@teste.com");
    });
    test('should call ErrorSignup', () async {
      when(firebaseAuth.createUserWithEmailAndPassword(
              email: "teste@teste.com", password: "12345678"))
          .thenThrow(Exception());
      var result = await repository.signUp(
          name: "teste", email: "teste@teste.com", password: "12345678");
      expect(result.leftMap((l) => l is ErrorSignup), Left(true));
      expect(result.fold((l) => l.message, id), Messages.FAILED_TO_SIGNUP);
    });
  });
}
