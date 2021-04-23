import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../modules/login/domain/errors/errors.dart';
import '../../../../modules/login/infra/datasources/login_datasource.dart';
import '../../../../modules/login/infra/models/user_model.dart';

//part 'firebase_datasource_login.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceLoginImpl implements LoginDataSource {
  final FirebaseAuth auth;

  FirebaseDataSourceLoginImpl(this.auth);

  @override
  Future<UserModel> loginEmail({String email, String password}) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    var user = result.user;

    return UserModel(
      uid: user.uid,
      email: user.email,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    var user = (auth.currentUser);

    if (user == null) throw ErrorGetLoggedUser();

    return UserModel(
      uid: user.uid,
      email: user.email,
    );
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
