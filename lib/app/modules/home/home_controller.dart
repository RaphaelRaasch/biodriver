import 'package:biodriver/app/modules/home/mtr_repository.dart';
import 'package:biodriver/app/shared/model/cliente_model.dart';
import 'package:biodriver/app/shared/model/mtr_model.dart';
import 'package:biodriver/app/shared/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserStore userStore;
  final AppController loged;
  MtrRepository _mtrRepository;

  _HomeControllerBase(this.userStore, this.loged) {
    _mtrRepository = MtrRepository();
  }

  @observable
  ObservableFuture<List<MtrModel>> observableFuture;

  @observable
  List<MtrModel> listMtr;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ClienteModel> clientList = <ClienteModel>[].asObservable();

  @action
  Future<void> loadMtr() async {
    List<MtrModel> list = await _mtrRepository.getAllMtrs();
    print('Lista ${list[0]}');
    observableFuture = ObservableFuture(_mtrRepository.getAllMtrs());
    listMtr = await observableFuture;
  }

  @action
  void setlogin() {
    loged.loggedOut();
    print(loged);
    Modular.to.popAndPushNamed('/');
  }
}
