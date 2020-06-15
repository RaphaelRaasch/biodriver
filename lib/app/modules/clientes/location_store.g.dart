// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _LocationStoreBase, Store {
  final _$latAtom = Atom(name: '_LocationStoreBase.lat');

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lngAtom = Atom(name: '_LocationStoreBase.lng');

  @override
  double get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  final _$positionStreamAtom = Atom(name: '_LocationStoreBase.positionStream');

  @override
  ObservableStream<dynamic> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(ObservableStream<dynamic> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  final _$gestorAtom = Atom(name: '_LocationStoreBase.gestor');

  @override
  String get gestor {
    _$gestorAtom.reportRead();
    return super.gestor;
  }

  @override
  set gestor(String value) {
    _$gestorAtom.reportWrite(value, super.gestor, () {
      super.gestor = value;
    });
  }

  final _$getLocationAsyncAction =
      AsyncAction('_LocationStoreBase.getLocation');

  @override
  Future<dynamic> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  final _$_LocationStoreBaseActionController =
      ActionController(name: '_LocationStoreBase');

  @override
  Stream<Position> streamPosition() {
    final _$actionInfo = _$_LocationStoreBaseActionController.startAction(
        name: '_LocationStoreBase.streamPosition');
    try {
      return super.streamPosition();
    } finally {
      _$_LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lat: ${lat},
lng: ${lng},
positionStream: ${positionStream},
gestor: ${gestor}
    ''';
  }
}
