import 'package:flutter/material.dart';
//import 'package:mg_iot/app/app_controller.dart';
//import '../../../app_module.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Margirius'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Preferências'),
        leading: Icon(Icons.settings),
        onTap: () {
          //AppModule.to.bloc<AppController>().changeTheme();
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Fechar'),
        onTap: () {
          // Update the state of the app.
          Navigator.pop(context);
        },
      ),
    ],
  ),
);
  }
}