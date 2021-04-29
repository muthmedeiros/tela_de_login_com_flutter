import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/signup/domain/entities/signup_validator.dart';
import 'package:tela_de_login/app/modules/signup/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/signup/domain/usecases/signup.dart';
import 'package:tela_de_login/app/modules/signup/infra/models/signup_user_model.dart';
import 'package:tela_de_login/app/modules/signup/infra/repositories/signup_repository.dart';

class SignupRepositoryMock extends Mock implements SignupRepository {}

main() {
  final repository = SignupRepositoryMock();
  final usecase = SignupImpl(repository);

  test('should return invalid email', () async {
    final result = await usecase(SignupValidator.withData(
      email: "teste",
      password: "",
      uid: "",
      name: "",
    ));

    expect(result.leftMap((l) => l is ErrorSignupEmail), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_EMAIL);
  });

  test('should return invalid password', () async {
    final result = await usecase(SignupValidator.withData(
      email: "teste@teste.com.br",
      password: "123",
      uid: "",
      name: "",
    ));

    expect(result.leftMap((l) => l is ErrorSignupPassword), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_PASSWORD);
  });

  test('should return invalid name', () async {
    final result = await usecase(SignupValidator.withData(
      email: "teste@teste.com.br",
      password: "12345678",
      uid: "",
      name: "",
    ));

    expect(result.leftMap((l) => l is ErrorSignupName), Left(true));
    expect(result.fold((l) => l.message, id), Messages.INVALID_NAME);
  });

  test('should return valid user', () async {
    final user = SignupUserModel(email: "teste@teste.com.br", uid: "teste123", name: "teste",);
    when(repository.signUp(
            name: "teste", email: "teste@teste.com.br", password: "1234567890",))
        .thenAnswer((_) async => Right(user));
    final result = await usecase(SignupValidator.withData(
        email: 'teste@teste.com.br', password: '1234567890', name: 'teste', uid: 'teste123',));

    expect(result, Right(user));
    expect(result.fold(id, (user) => user.email), 'teste@teste.com.br');
    expect(result.fold(id, (user) => user.uid), 'teste123');
    expect(result.fold(id, (user) => user.name), 'teste');
  });
}
