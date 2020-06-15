import 'dart:convert';

import 'package:biodriver/app/shared/consts.dart';
import 'package:biodriver/app/shared/model/user_model.dart';
import 'package:biodriver/app/shared/store/mtr_store.dart';
import 'package:biodriver/app/shared/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserStore store;
  final AppController loged;

  _LoginControllerBase(
    this.store,
    this.loged,
  );

  @observable
  String email = '';
  @observable
  String password = '';

  @action
  Future login() async {
    try {
      var response = await http
          .post(API_AUTH, body: {'username': email, 'password': password});
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);
      store.setUser(user);
      print(user.firstName);
      print(user.token);
      print(user.fone);

      if (response.statusCode == 200) {
        loged.loggedIn();
        print(loged);
        Modular.to.pushReplacementNamed('/home');
      } else {
        return;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
