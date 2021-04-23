import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/app_theme.dart';

import 'package:tela_de_login/app/modules/login/presentation/login_store.dart';

import 'custom_text_fields.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<LoginForm, LoginStore> {
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeApp.appBoxWidget,
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
      margin: const EdgeInsets.only(top: 26, left: 30, bottom: 10, right: 30),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 10.0, bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomTextFields(
              textPlaceHolder: "E-mail",
              textIcon: Icons.person,
              keyboardType: TextInputType.emailAddress,
              controller: textController,
              onChanged: controller.setEmail,
            ),
            CustomTextFields(
              textPlaceHolder: "Senha",
              textIcon: Icons.lock,
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: textController,
              onChanged: controller.setPassword,
            ),
          ],
        ),
      ),
    );
  }
}
