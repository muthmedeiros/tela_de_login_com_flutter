import 'package:flutter/cupertino.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/logged_user.dart';
import 'package:tela_de_login/app/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({@required String email, @required String uid})
      : super(email: email, uid: uid);

  LoggedUser toLoggedUser() => this;
}
