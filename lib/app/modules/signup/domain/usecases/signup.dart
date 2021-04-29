import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/errors/errors.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/signup/domain/entities/signup_validator.dart';
import 'package:tela_de_login/app/modules/signup/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/signup/infra/models/signup_user_model.dart';
import 'package:tela_de_login/app/modules/signup/infra/repositories/signup_repository.dart';

part 'signup.g.dart';

abstract class Signup {
  Future<Either<Failure, SignupUserModel>> call(
      SignupValidator signupValidator);
}

@Injectable(singleton: false)
class SignupImpl implements Signup {
  final SignupRepository repository;

  SignupImpl(this.repository);

  @override
  Future<Either<Failure, SignupUserModel>> call(
      SignupValidator signupValidator) async {
    if (!signupValidator.isValidEmail)
      return Left(ErrorSignupEmail(message: Messages.INVALID_EMAIL));
    if (!signupValidator.isValidPassword)
      return Left(ErrorSignupPassword(message: Messages.INVALID_PASSWORD));
    if (!signupValidator.isValidName)
      return Left(ErrorSignupName(message: Messages.INVALID_NAME));
    return await repository.signUp(
      name: signupValidator.name,
      email: signupValidator.email,
      password: signupValidator.password,
    );
  }
}
