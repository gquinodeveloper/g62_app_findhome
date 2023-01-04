class RequestReservationModel {
    RequestReservationModel({
      required this.idUser,
      required this.idHouse,
      required this.date,
      required this.price,
    });

    String idUser;
    int idHouse;
    String date;
    int price;

    Map<String, dynamic> toMap() => {
        "id_user": idUser,
        "idHouse": idHouse,
        "date": date,
        "price": price,
    };
}
