import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_de_login/app/core/stores/auth_store.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

splashScreenPage() {
  Future.delayed(Duration(seconds: 3)).whenComplete(() async {
    bool isLogged = await Modular.get<AuthStore>().checkLogin();
    isLogged
        ? Modular.to.pushNamedAndRemoveUntil("/home", (_) => false)
        : Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
  });
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    splashScreenPage();
    animationController();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest),
              ).animate(CurvedAnimation(
                parent: animationController1(),
                curve: Curves.elasticInOut,
              )),
              child: const Padding(
                  padding: EdgeInsets.all(8), child: FlutterLogo()),
            ),
          ],
        );
      },
    );
  }

  Animation<double> animationController1() {
    final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    return _controller;
  }

  void animationController() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
