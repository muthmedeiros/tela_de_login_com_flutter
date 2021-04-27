import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/modules/login/infra/models/user_model.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/errors/messages.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import '../../../../modules/login/domain/errors/errors.dart';

part 'login_repository_impl.g.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password});

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth auth;

  LoginRepositoryImpl(this.auth);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password}) async {
    try {
      var result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;

      final userModel = UserModel(
        uid: user.uid,
        email: user.email,
      );

      return Right(userModel);
    } catch (e) {
      return Left(ErrorLoginEmail(message: Messages.FAILED_TO_LOGIN));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = (auth.currentUser);

      if (user == null) throw ErrorGetLoggedUser();

      final userModel = UserModel(
        uid: user.uid,
        email: user.email,
      );
      return Right(userModel);
    } catch (e) {
      return Left(
          ErrorGetLoggedUser(message: Messages.FAILED_TO_RECOVER_USER_LOGGED));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await auth.signOut();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: Messages.FAILED_TO_LOGOUT));
    }
  }
}
