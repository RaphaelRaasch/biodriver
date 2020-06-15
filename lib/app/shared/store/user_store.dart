import 'package:biodriver/app/shared/model/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserModel userModel;

  @action
  void setUser(UserModel v) {
    userModel = v;
  }
}
