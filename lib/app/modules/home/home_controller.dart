import 'package:biodriver/app/modules/home/mtr_repository.dart';
import 'package:biodriver/app/shared/model/mtr_model.dart';
import 'package:biodriver/app/shared/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';
import '../../shared/model/mtr_model.dart';

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
  ObservableFuture<List<MtrItemModel>> observableFuture;

  @observable
  List<MtrItemModel> listMtr;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Sequencia> clientList = <Sequencia>[].asObservable();

  @action
  Future<void> loadMtr() async {
    List<MtrItemModel> list = await _mtrRepository.getAllMtrs();
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
