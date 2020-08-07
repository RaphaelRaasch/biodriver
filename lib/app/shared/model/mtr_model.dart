class MtrItemModel {
  int id;
  Mtr mtr;
  List<Sequencia> sequencia;

  MtrItemModel({this.id, this.mtr, this.sequencia});

  MtrItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mtr = json['mtr'] != null ? new Mtr.fromJson(json['mtr']) : null;
    if (json['sequencia'] != null) {
      sequencia = new List<Sequencia>();
      json['sequencia'].forEach((v) {
        sequencia.add(new Sequencia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.mtr != null) {
      data['mtr'] = this.mtr.toJson();
    }
    if (this.sequencia != null) {
      data['sequencia'] = this.sequencia.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mtr {
  int id;
  int numero;
  int motorista;
  String alias;
  Null saida;
  Null chegada;
  int caminhao;

  Mtr(
      {this.id,
      this.numero,
      this.motorista,
      this.alias,
      this.saida,
      this.chegada,
      this.caminhao});

  Mtr.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    motorista = json['motorista'];
    alias = json['alias'];
    saida = json['saida'];
    chegada = json['chegada'];
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
    data['caminhao'] = this.caminhao;
    return data;
  }
}

class Sequencia {
  int numero;
  int mtr;
  int cliente;
  String rua;
  String bairro;
  String municipio;
  String estado;
  String lat;
  String long;

  Sequencia(
      {this.numero,
      this.mtr,
      this.cliente,
      this.rua,
      this.bairro,
      this.municipio,
      this.estado,
      this.lat,
      this.long});

  Sequencia.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    mtr = json['mtr'];
    cliente = json['cliente'];
    rua = json['rua'];
    bairro = json['bairro'];
    municipio = json['municipio'];
    estado = json['estado'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['mtr'] = this.mtr;
    data['cliente'] = this.cliente;
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['municipio'] = this.municipio;
    data['estado'] = this.estado;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
