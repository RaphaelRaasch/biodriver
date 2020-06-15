import 'dart:async';

import 'package:biodriver/app/shared/model/cliente_model.dart';
import 'package:biodriver/app/shared/store/user_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {
  Geolocator geolocator = Geolocator();
  LocationOptions locationOptions =
      LocationOptions(accuracy: LocationAccuracy.bestForNavigation);
  final UserStore store;
  Firestore firestore;

  @observable
  double lat;
  @observable
  double lng;
  @observable
  ObservableStream positionStream;
  @observable
  String gestor;

  _LocationStoreBase(this.store);

  @action
  Stream<Position> streamPosition() {
    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      lat = position.latitude;
      lng = position.longitude;
      Firestore.instance.collection('userLocate').document(gestor).setData({
        'first_name': store.userModel.firstName,
        'last_name': store.userModel.lastName,
        'gestor': gestor,
        'latitude': lat,
        'longitude': lng,
      });
    });
  }

  @action
  Future getLocation() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    lng = position.longitude;
    Firestore.instance.collection('userLocate').document('Motoristax').setData(
      {
        'gestor': gestor,
        'latitude': lat,
        'longitude': lng,
      },
    );
    streamPosition();
  }
}
