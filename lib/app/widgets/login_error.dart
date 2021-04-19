import 'package:flutter/material.dart';

import 'login_error_widget.dart';

class LoginError extends StatelessWidget {
  final bool isLogged;
  final bool credentialError;

  LoginError({this.isLogged, this.credentialError});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // todo: concertar erro de credencial NULL
          if (!isLogged && credentialError) LoginErrorWidget(),
        ],
      ),
    );
  }
}
