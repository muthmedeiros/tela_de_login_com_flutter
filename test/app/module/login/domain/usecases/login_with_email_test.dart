import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/login_validator.dart';
import 'package:tela_de_login/app/modules/login/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:tela_de_login/app/modules/login/infra/models/user_model.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class FirebaseUserMock extends Mock implements User {}

main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginWithEmailImpl(repository);

  test('should return invalid email', () async {
    final result =
        await usecase(LoginValidator.withData(email: "teste", password: ""));

    expect(result.leftMap((l) => l is ErrorLoginEmail), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_EMAIL);
  });

  test('should return invalid credentials', () async {
    final result = await usecase(
        LoginValidator.withData(email: "teste@teste.com.br", password: "123"));

    expect(result.leftMap((l) => l is ErrorLogin), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_CREDENTIALS);
  });

  test('should return valid user', () async {
    final user = UserModel(email: "teste@teste.com.br", uid: "teste123");
    when(repository.loginEmail(
            email: "teste@teste.com.br", password: "1234567890"))
        .thenAnswer((_) async => Right(user));
    final result = await usecase(LoginValidator.withData(
        email: 'teste@teste.com.br', password: '1234567890'));

    expect(result, Right(user));
    expect(result.fold(id, (user) => user.email), 'teste@teste.com.br');
    expect(result.fold(id, (user) => user.uid), 'teste123');
  });
}
