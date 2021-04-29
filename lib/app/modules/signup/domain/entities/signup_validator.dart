import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignupValidator {
  String name;
  String email;
  String password;
  String uid;

  bool get isValidName => name.length > 1;

  bool get isValidEmail => validator.isEmail(email ?? '');

  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length >= 8;

  SignupValidator._({
    this.name,
    this.email,
    this.password,
    this.uid,
  });

  factory SignupValidator.withData({
    @required String name,
    @required String email,
    @required String password,
    @required String uid,
  }) {
    return SignupValidator._(
      name: name,
      email: email,
      password: password,
      uid: uid,
    );
  }
}
