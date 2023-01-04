import 'package:dio/dio.dart';
import 'package:g62_find_home/app/data/models/request/request_user_model.dart';
import 'package:g62_find_home/app/data/models/response/response_user_information_model.dart';
import 'package:g62_find_home/app/data/models/response/response_user_model.dart';
import 'package:g62_find_home/app/services/local_storage_service.dart';
import 'package:g62_find_home/core/utils/keys.dart';
import 'package:get/get.dart';

class UserProvider {
  final _dio = Get.find<Dio>();

  Future<ResponseUserModel> postUserInsert(RequestUserModel request) async {
    final response = await _dio.post(
      "/api/user/register",
      data: request.toMap(),
    );
    return ResponseUserModel.fromJson(response.data);
  }

  Future<ResponseUserInformationModel> getUserInformation() async {
    final idUser = await LocalStorageService.get(key: Keys.kIdUser);
    final response = await _dio.get(
      "/api/user/information/$idUser",
      options: Options(
        headers: {
          "auth": await LocalStorageService.get(key: Keys.kToken),
        },
      ),
    );
    return ResponseUserInformationModel.fromJson(
      response.data["information"][0],
    );
  }
}
