import 'package:flutter/material.dart';

import 'login_error_widget.dart';

class LoginError extends StatelessWidget {
  final bool credentialError;

  LoginError({this.credentialError});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (credentialError) LoginErrorWidget(),
        ],
      ),
    );
  }
}
