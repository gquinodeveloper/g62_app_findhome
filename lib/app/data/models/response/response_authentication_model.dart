class ResponseAuthenticationModel {
  ResponseAuthenticationModel({
    this.success,
    this.requestToken,
    this.idUser,
    this.message,
  });

  bool? success;
  String? requestToken;
  String? idUser;
  String? message;

  factory ResponseAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      ResponseAuthenticationModel(
        success: json["success"] ?? "",
        message: json["message"] ?? "",
        requestToken: json["request_token"] ?? "",
        idUser: json["id_user"].toString(),
      );
}

/* 
class ResponseAuthenticationModel {
  ResponseAuthenticationModel({
    this.success,
    this.message,
    this.accessToken,
    this.user,
  });

  bool? success;
  String? message;
  String? accessToken;
  User? user;

  factory ResponseAuthenticationModel.fromJson(Map<String, dynamic> json) =>
      ResponseAuthenticationModel(
        success: json["success"],
        message: json["message"],
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
      );

  /*  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "accessToken": accessToken,
        "user": user?.toJson(),
    }; */
}

class User {
  User({
    this.country,
    this.itemtype,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.hash,
    this.displayName,
  });

  Country? country;
  String? itemtype;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? hash;
  String? displayName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        country: Country.fromJson(json["country"]),
        itemtype: json["itemtype"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        hash: json["hash"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        //"country": country.toJson(),
        "itemtype": itemtype,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "hash": hash,
        "displayName": displayName,
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.locale,
    this.currencyId,
  });

  String? id;
  String? name;
  String? locale;
  String? currencyId;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        locale: json["locale"],
        currencyId: json["currency_id"],
      );

  /*  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locale": locale,
        "currency_id": currencyId,
    }; */
} */
