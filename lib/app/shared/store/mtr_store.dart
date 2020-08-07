import 'package:biodriver/app/shared/model/mtr_model.dart';
import 'package:mobx/mobx.dart';

import '../model/mtr_model.dart';

part 'mtr_store.g.dart';

class MtrStore = _MtrStoreBase with _$MtrStore;

abstract class _MtrStoreBase with Store {
  @observable
  List<MtrItemModel> mtrModel;

  @action
  void getAllMtr(List<MtrItemModel> v) {
    mtrModel = v;
  }
}
