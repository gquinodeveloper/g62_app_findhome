import 'package:dio/dio.dart';
import 'package:g62_find_home/app/data/models/request/request_reservation_model.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/services/local_storage_service.dart';
import 'package:g62_find_home/core/utils/keys.dart';
import 'package:get/get.dart';

class HouseProvider {
  final _dio = Get.find<Dio>();

  Future<ResponseHouseModel> getHouses() async {
    final response = await _dio.get(
      "/api/house/houses/1/6",
      options: Options(
        headers: {
          "auth": await LocalStorageService.get(key: Keys.kToken),
        },
      ),
    );
    return ResponseHouseModel.fromJson(response.data);
  }

  Future<String> postInsertReservation(RequestReservationModel request) async {
    final response = await _dio.post(
      "/api/reservation/register",
      options: Options(
        headers: {
          "auth": await LocalStorageService.get(key: Keys.kToken),
        },
      ),
      data: request.toMap(),
    );

    return response.data["message"];
  }
}
