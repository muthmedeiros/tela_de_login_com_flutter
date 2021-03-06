import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tela_de_login/app/app_theme.dart';
import 'package:tela_de_login/app/widgets/custom_sized_box.dart';
import 'package:tela_de_login/app/widgets/enter_button.dart';
import 'package:tela_de_login/app/widgets/image_with_shadow.dart';
import 'package:tela_de_login/app/widgets/login_background.dart';
import 'package:tela_de_login/app/widgets/login_form.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<LoginPage, LoginStore> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an error! ${snapshot.error.toString()}");
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            return Scaffold(
                backgroundColor: ThemeApp.appColor,
                body: SingleChildScrollView(
                  child: Stack(
                    children: [
                      LoginBackground(imageAsset: 'images/paisagem.png'),
                      Column(
                        children: <Widget>[
                          CustomSizedBox(),
                          ImageWithShadow(
                            imageAsset: 'images/computador.png',
                          ),
                          LoginForm(),
                          EnterButton(
                              buttonText: "Login",
                              onPressed: controller.enterLoginEmail),
                        ],
                      ),
                    ],
                  ),
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
