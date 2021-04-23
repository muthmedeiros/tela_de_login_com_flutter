import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/errors.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import '../../../../modules/login/domain/repositories/login_repository.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(String email, String password);
}

@Injectable(singleton: false)
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      String email, String password) async {
    return await repository.loginEmail(email: email, password: password);
  }
}
