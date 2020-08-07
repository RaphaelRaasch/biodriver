import 'package:mobx/mobx.dart';

part 'badge_controller.g.dart';

class BadgeController = _BadgeControllerBase with _$BadgeController;

abstract class _BadgeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
