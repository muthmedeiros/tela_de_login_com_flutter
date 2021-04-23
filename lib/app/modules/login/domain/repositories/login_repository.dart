import 'package:dartz/dartz.dart';
import 'package:tela_de_login/app/core/errors/errors.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password});

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
