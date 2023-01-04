class RequestUserModel {
  RequestUserModel({
    this.name = "",
    this.lastname = "",
    this.adress = "",
    this.email = "",
    this.password = "",
  });

  String name;
  String lastname;
  String adress;
  String email;
  String password;

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastname": lastname,
        "adress": adress,
        "email": email,
        "password": password,
      };
}
