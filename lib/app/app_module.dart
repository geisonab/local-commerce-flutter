import 'package:local_commerce/app/modules/home/homepagemapa.dart';
import 'package:local_commerce/app/views/splashscreen/splashscreen_controller.dart';
import 'package:local_commerce/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:local_commerce/app/app_widget.dart';
import 'package:local_commerce/app/modules/home/home_module.dart';
import 'package:local_commerce/app/views/splashscreen/splashscreen_page.dart';
import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashscreenController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashscreenPage()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        //Router('/home/', child: (_,args) => homepagemapa()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
