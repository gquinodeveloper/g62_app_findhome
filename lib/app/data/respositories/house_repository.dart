import 'package:g62_find_home/app/data/models/request/request_reservation_model.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/data/providers/house_provider.dart';
import 'package:get/get.dart';

class HouseRepository {
  final _apiProvider = Get.find<HouseProvider>();
  Future<ResponseHouseModel> getHouses() => _apiProvider.getHouses();

  Future<String> postInsertReservation(RequestReservationModel request) =>
      _apiProvider.postInsertReservation(request);
}
