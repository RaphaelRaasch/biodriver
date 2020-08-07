import 'package:biodriver/app/modules/clientes/location_store.dart';
import 'package:biodriver/app/modules/clientes/widget/map.widget.dart';
import 'package:biodriver/app/shared/model/cliente_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../shared/model/mtr_model.dart';
import 'clientes_controller.dart';

class ClientesPage extends StatefulWidget {
  final String title;
  final List<Sequencia> sequencia;
  const ClientesPage({Key key, this.title = "Clientes", this.sequencia})
      : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState
    extends ModularState<ClientesPage, ClientesController> {
  //use 'controller' variable to access controller
  MapWidget map;
  LocationStore locattion = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (context) {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: widget.sequencia.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    createAlertMin(context, index);
                  },
                  leading: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text(
                    widget.sequencia[index].cliente.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  onLongPress: () {
                    createAlert(context, index);
                  },
                  subtitle: Text(widget.sequencia[index].municipio),
                );
              },
            );
          },
        ));
  }

  createAlert(BuildContext context, index) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (
        context,
      ) {
        return AlertDialog(
          title: Text(widget.sequencia[index].cliente.toString()),
          content: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(),
                Container(
                  child: Text(widget.sequencia[index].rua),
                ),
                Container(
                  child: Text(widget.sequencia[index].bairro),
                ),
                Container(
                  child: Text(
                      '${widget.sequencia[index].municipio} - ${widget.sequencia[index].estado}'),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                )),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.pin_drop,
                color: Colors.black,
              ),
              onPressed: () {
                openMapsSheet(context, index);
              },
            ),
            IconButton(icon: Icon(Icons.call), onPressed: () {})
          ],
          scrollable: true,
        );
      },
    );
  }

  createAlertMin(BuildContext context, index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(widget.sequencia[index].cliente.toString()),
          content: Container(
            height: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Logradouro: ${widget.sequencia[index].rua}'),
                Text('Bairro: ${widget.sequencia[index].bairro}'),
                Text('Municipio: ${widget.sequencia[index].municipio}'),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            FlatButton(
              color: Colors.black,
              onPressed: () {
                locattion.gestor = widget.sequencia[index].cliente.toString();
                openMapsSheet(context, index);
                locattion.getLocation();
                print('OK');
              },
              child: Text('Iniciar Viagem'),
            ),
          ],
        );
      },
    );
  }

  openMapsSheet(context, index) async {
    double lat = double.tryParse(widget.sequencia[index].lat);
    double lng = double.tryParse(widget.sequencia[index].long);
    try {
      final title = widget.sequencia[index].cliente.toString();
      final description = widget.sequencia[index].cliente.toString();
      final coords = Coords(lat, lng);
      final availableMaps = await MapLauncher.installedMaps;

      print(availableMaps);

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
