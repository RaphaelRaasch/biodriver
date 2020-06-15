class UserModel {
  String token;
  int userId;
  String firstName;
  String lastName;
  String email;
  String fone;
  String type;

  UserModel(
      {this.token,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.fone,
      this.type});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    fone = json['fone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['fone'] = this.fone;
    data['type'] = this.type;
    return data;
  }
}
