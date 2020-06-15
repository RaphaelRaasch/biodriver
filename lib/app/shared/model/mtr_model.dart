import 'package:biodriver/app/shared/model/cliente_model.dart';

class MtrModel {
  int id;
  int numero;
  int motorista;
  String alias;
  String saida;
  String chegada;
  List<ClienteModel> cliente;
  int caminhao;

  MtrModel({
    this.id,
    this.numero,
    this.motorista,
    this.alias,
    this.saida,
    this.chegada,
    this.cliente,
    this.caminhao,
  });

  MtrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    motorista = json['motorista'];
    alias = json['alias'];
    saida = json['saida'];
    chegada = json['chegada'];
    if (json['cliente'] != null) {
      cliente = new List<ClienteModel>();
      json['cliente'].forEach((v) {
        cliente.add(new ClienteModel.fromJson(v));
      });
    }
    caminhao = json['caminhao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numero'] = this.numero;
    data['motorista'] = this.motorista;
    data['alias'] = this.alias;
    data['saida'] = this.saida;
    data['chegada'] = this.chegada;
    if (this.cliente != null) {
      data['cliente'] = this.cliente.map((v) => v.toJson()).toList();
    }
    data['caminhao'] = this.caminhao;
    return data;
  }
}
