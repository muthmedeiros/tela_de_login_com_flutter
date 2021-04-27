import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginValidator {
  String email;
  String password;

  bool get isValidEmail => validator.isEmail(email ?? '');

  bool get isValidPassword =>
      password != null && password.isNotEmpty && password.length >= 8;

  LoginValidator._({
    this.email,
    this.password,
  });

  factory LoginValidator.withData({
    @required String email,
    @required String password,
  }) {
    return LoginValidator._(
      email: email,
      password: password,
    );
  }
}
