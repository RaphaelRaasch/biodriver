// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$observableFutureAtom =
      Atom(name: '_HomeControllerBase.observableFuture');

  @override
  ObservableFuture<List<MtrModel>> get observableFuture {
    _$observableFutureAtom.reportRead();
    return super.observableFuture;
  }

  @override
  set observableFuture(ObservableFuture<List<MtrModel>> value) {
    _$observableFutureAtom.reportWrite(value, super.observableFuture, () {
      super.observableFuture = value;
    });
  }

  final _$listMtrAtom = Atom(name: '_HomeControllerBase.listMtr');

  @override
  List<MtrModel> get listMtr {
    _$listMtrAtom.reportRead();
    return super.listMtr;
  }

  @override
  set listMtr(List<MtrModel> value) {
    _$listMtrAtom.reportWrite(value, super.listMtr, () {
      super.listMtr = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$clientListAtom = Atom(name: '_HomeControllerBase.clientList');

  @override
  ObservableList<ClienteModel> get clientList {
    _$clientListAtom.reportRead();
    return super.clientList;
  }

  @override
  set clientList(ObservableList<ClienteModel> value) {
    _$clientListAtom.reportWrite(value, super.clientList, () {
      super.clientList = value;
    });
  }

  final _$loadMtrAsyncAction = AsyncAction('_HomeControllerBase.loadMtr');

  @override
  Future<void> loadMtr() {
    return _$loadMtrAsyncAction.run(() => super.loadMtr());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setlogin() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setlogin');
    try {
      return super.setlogin();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableFuture: ${observableFuture},
listMtr: ${listMtr},
isLoading: ${isLoading},
clientList: ${clientList}
    ''';
  }
}
