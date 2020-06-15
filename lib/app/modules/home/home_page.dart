import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.loadMtr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = controller.userStore.userModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${user.firstName} ${user.lastName}'),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            controller.setlogin();
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          if (controller.observableFuture == null ||
              controller.observableFuture.status == FutureStatus.rejected ||
              controller.observableFuture.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.observableFuture.error != null) {
            return Center(
              child: Text('Erro ao importar lista'),
            );
          }
          final list = controller.listMtr;
          return controller.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  addAutomaticKeepAlives: true,
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.flag,
                        color: Colors.black,
                      ),
                      title: Text(
                        list[index].alias,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      subtitle: Text(list[index].numero.toString()),
                      onTap: () {
                        Modular.to.pushNamed('/clientes',
                            arguments: list[index].cliente);
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
