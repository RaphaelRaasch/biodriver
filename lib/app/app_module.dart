import 'package:biodriver/app/modules/clientes/clientes_module.dart';
import 'package:biodriver/app/shared/store/mtr_store.dart';
import 'package:biodriver/app/shared/store/user_store.dart';
import 'package:biodriver/app/app_controller.dart';
import 'package:biodriver/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:biodriver/app/app_widget.dart';
import 'package:biodriver/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MtrStore()),
        Bind((i) => UserStore()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/clientes', module: ClientesModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
