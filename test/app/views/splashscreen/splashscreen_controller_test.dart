import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:local_commerce/app/views/splashscreen/splashscreen_controller.dart';
import 'package:local_commerce/app/app_module.dart';

void main() {
  initModule(AppModule());
  SplashscreenController splashscreen;

  setUp(() {
    splashscreen = AppModule.to.get<SplashscreenController>();
  });

  group('SplashscreenController Test', () {
    test("First Test", () {
      expect(splashscreen, isInstanceOf<SplashscreenController>());
    });

    test("Set Value", () {
      expect(splashscreen.value, equals(0));
      splashscreen.increment();
      expect(splashscreen.value, equals(1));
    });
  });
}
