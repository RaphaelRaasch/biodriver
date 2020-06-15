// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MtrStore on _MtrStoreBase, Store {
  final _$mtrModelAtom = Atom(name: '_MtrStoreBase.mtrModel');

  @override
  List<MtrModel> get mtrModel {
    _$mtrModelAtom.reportRead();
    return super.mtrModel;
  }

  @override
  set mtrModel(List<MtrModel> value) {
    _$mtrModelAtom.reportWrite(value, super.mtrModel, () {
      super.mtrModel = value;
    });
  }

  final _$_MtrStoreBaseActionController =
      ActionController(name: '_MtrStoreBase');

  @override
  void getAllMtr(List<MtrModel> v) {
    final _$actionInfo = _$_MtrStoreBaseActionController.startAction(
        name: '_MtrStoreBase.getAllMtr');
    try {
      return super.getAllMtr(v);
    } finally {
      _$_MtrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mtrModel: ${mtrModel}
    ''';
  }
}
