class ClienteModel {
  int id;
  int idMultidev;
  String razaoSocial;
  int gestao;
  String fantasia;
  String logradouro;
  String bairro;
  String municipio;
  String estado;
  String latitude;
  String longitude;

  ClienteModel(
      {this.id,
      this.idMultidev,
      this.razaoSocial,
      this.gestao,
      this.fantasia,
      this.logradouro,
      this.bairro,
      this.municipio,
      this.estado,
      this.latitude,
      this.longitude});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idMultidev = json['id_multidev'];
    razaoSocial = json['razao_social'];
    gestao = json['gestao'];
    fantasia = json['fantasia'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    municipio = json['municipio'];
    estado = json['estado'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_multidev'] = this.idMultidev;
    data['razao_social'] = this.razaoSocial;
    data['gestao'] = this.gestao;
    data['fantasia'] = this.fantasia;
    data['logradouro'] = this.logradouro;
    data['bairro'] = this.bairro;
    data['municipio'] = this.municipio;
    data['estado'] = this.estado;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
