import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/tela_de_login/lib/app/app_theme.dart';

class LoginErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: ThemeApp.appLoginInfoWidget,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: ThemeApp.appBoxShadow,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        'Erro: Credenciais Inválidas',
      ),
    );
  }
}
