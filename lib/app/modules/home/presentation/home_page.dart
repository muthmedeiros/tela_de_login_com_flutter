import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';
import 'package:tela_de_login/app/modules/home/presentation/home_store.dart';
import 'package:tela_de_login/app/widgets/custom_sized_box.dart';
import 'package:tela_de_login/app/widgets/enter_button.dart';
import 'package:tela_de_login/app/widgets/image_with_shadow.dart';
import 'package:tela_de_login/app/widgets/login_background.dart';

import 'file:///D:/AndroidStudioProjects/tela_de_login/lib/app/app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final auth = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeApp.appColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              LoginBackground(imageAsset: 'images/paisagem.png'),
              Center(
                child: Column(
                  children: <Widget>[
                    CustomSizedBox(),
                    ImageWithShadow(
                      imageAsset: 'images/computador.png',
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Seja bem vindo ${auth?.user?.email}\n\n"
                          "Seu ID é: ${auth?.user?.uid}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ThemeApp.appBoxWidget,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    EnterButton(
                      buttonText: "Logout",
                      onPressed: () {
                        auth.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
