import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/errors/errors.dart';
import 'package:tela_de_login/app/core/errors/messages.dart';
import 'package:tela_de_login/app/modules/signup/domain/errors/errors.dart';
import 'package:tela_de_login/app/modules/signup/infra/models/signup_user_model.dart';

part 'signup_repository.g.dart';

abstract class SignupRepository {
  Future<Either<Failure, SignupUserModel>> signUp(
      {String name, String email, String password});
}

@Injectable(singleton: false)
class SignupRepositoryImpl implements SignupRepository {
  final FirebaseAuth auth;

  SignupRepositoryImpl(this.auth);

  @override
  Future<Either<Failure, SignupUserModel>> signUp({
    String name,
    String email,
    String password,
  }) async {
    try {
      var result = await auth.createUserWithEmailAndPassword(
          email: email, password: password, );
      var user = result.user;

      final signupUserModel = SignupUserModel(
        name: name,
        uid: user.uid,
        email: user.email,
      );

      return Right(signupUserModel);
    } catch (e) {
      return Left(ErrorSignup(message: Messages.FAILED_TO_SIGNUP));
    }
  }
}
