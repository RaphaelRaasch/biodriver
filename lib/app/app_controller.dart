import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  bool logged = false;

  @action
  void loggedIn() {
    logged = true;
  }

  @action
  void loggedOut() {
    logged = false;
  }
}
