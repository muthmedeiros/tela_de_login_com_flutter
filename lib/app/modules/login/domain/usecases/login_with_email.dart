import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/login_validator.dart';
import 'package:tela_de_login/app/modules/login/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';

import '../../../../core/errors/errors.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(LoginValidator loginValidator);
}

@Injectable(singleton: false)
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginValidator loginValidator) async {
    if (!loginValidator.isValidEmail)
      return Left(ErrorLoginEmail(message: Messages.INVALID_EMAIL));
    if (!loginValidator.isValidPassword)
      return Left(ErrorLogin(message: Messages.INVALID_CREDENTIALS));
    return await repository.loginEmail(
      email: loginValidator.email,
      password: loginValidator.password,
    );
  }
}
