class ResponseHouseModel {
  ResponseHouseModel({
    this.page,
    this.result,
  });

  String? page;
  List<House>? result;

  factory ResponseHouseModel.fromJson(Map<String, dynamic> json) =>
      ResponseHouseModel(
        page: json["page"],
        result: List<House>.from(
          json["result"].map(
            (x) => House.fromJson(x),
          ),
        ),
      );
}

class House {
  House({
    this.idHouse,
    this.name,
    this.idPhoto,
    this.photo,
    this.user,
    this.avatar,
    this.rating,
    this.location,
    this.price,
    this.reviews,
    this.bedroom,
    this.menu,
    this.bathroom,
    this.description,
    this.utilities,
    this.aviable,
  });

  int? idHouse;
  String? name;
  int? idPhoto;
  String? photo;
  String? user;
  String? avatar;
  int? rating;
  String? location;
  int? price;
  int? reviews;
  int? bedroom;
  int? menu;
  int? bathroom;
  String? description;
  String? utilities;
  int? aviable;

  factory House.fromJson(Map<String, dynamic> json) => House(
        idHouse: json["idHouse"],
        name: json["name"],
        idPhoto: json["idPhoto"],
        photo: json["Photo"],
        user: json["user"],
        avatar: json["avatar"],
        rating: json["rating"],
        location: json["location"],
        price: json["price"],
        reviews: json["reviews"],
        bedroom: json["bedroom"],
        menu: json["menu"],
        bathroom: json["bathroom"],
        description: json["description"],
        utilities: json["utilities"],
        aviable: json["aviable"],
      );
}
