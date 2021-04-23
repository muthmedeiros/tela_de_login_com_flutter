import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/modules/login/infra/repositories/login_repository_impl.dart';

import '../../../../core/errors/errors.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';


//part 'get_logged_user.g.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
