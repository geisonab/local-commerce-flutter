import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushReplacementNamed('/home/');
        },
        child: Icon(Icons.supervised_user_circle),
      ),
    );
  }
}
