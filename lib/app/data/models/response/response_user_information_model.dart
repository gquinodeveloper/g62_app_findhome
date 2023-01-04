class ResponseUserInformationModel {
  ResponseUserInformationModel({
    this.idUser,
    this.name,
    this.lastname,
    this.address,
    this.email,
    this.password,
  });

  int? idUser;
  String? name;
  String? lastname;
  String? address;
  String? email;
  String? password;

  factory ResponseUserInformationModel.fromJson(Map<String, dynamic> json) =>
      ResponseUserInformationModel(
        idUser: json["idUser"],
        name: json["name"],
        lastname: json["lastname"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
      );
}
