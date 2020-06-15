import 'package:biodriver/app/modules/clientes/location_store.dart';
import 'package:biodriver/app/modules/clientes/clientes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:biodriver/app/modules/clientes/clientes_page.dart';

class ClientesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LocationStore(Modular.get())),
        Bind((i) => ClientesController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientesPage(clientes: args.data)),
      ];

  static Inject get to => Inject<ClientesModule>.of();
}
