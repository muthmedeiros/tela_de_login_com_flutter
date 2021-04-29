import 'package:flutter/cupertino.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/logged_user.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/logged_user_info.dart';

class SignupUserModel extends LoggedUser implements LoggedUserInfo {
  SignupUserModel({
    @required String name,
    @required String email,
    @required String uid,
  }) : super(
          name: name,
          email: email,
          uid: uid,
        );

  SignupUserModel toSignupUser() => this;
}
