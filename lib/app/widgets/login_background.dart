import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {

  final String imageAsset;

  const LoginBackground({Key key, this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22.0),
            child: Transform.translate(
              offset: Offset(0, 81),
              child: Image.asset(
                imageAsset,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
