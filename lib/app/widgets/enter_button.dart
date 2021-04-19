import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/tela_de_login/lib/app/app_theme.dart';

class EnterButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const EnterButton({Key key, this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 42,
      margin: EdgeInsets.only(top: 10, bottom: 25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeApp.appBoxShadow,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color(0XFF5386CB)), // todo: arrumar cor
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Berlin',
          ),
        ),
      ),
    );
  }
}
