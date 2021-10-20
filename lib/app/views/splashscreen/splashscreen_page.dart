import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashscreenPage extends StatefulWidget {
  final String title;
  const SplashscreenPage({Key key, this.title = "Splashscreen"})
      : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((v){
      Modular.to.pushReplacementNamed('/login/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
