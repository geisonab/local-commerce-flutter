import 'package:mobx/mobx.dart';

part 'splashscreen_controller.g.dart';

class SplashscreenController = _SplashscreenBase with _$SplashscreenController;

abstract class _SplashscreenBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
