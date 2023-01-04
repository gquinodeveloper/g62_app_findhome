import 'package:dio/dio.dart';
import 'package:g62_find_home/app/data/models/request/request_authentication_model.dart';
import 'package:g62_find_home/app/data/models/response/response_authentication_model.dart';
import 'package:get/get.dart';

class AuthenticationProvider {
  final _dio = Get.find<Dio>();

  Future<ResponseAuthenticationModel> authentication(
    RequestAuthenticationModel request,
  ) async {
    final response = await _dio.post(
      "/api/user/auth",
      data:request.toMap(),
    );
    return ResponseAuthenticationModel.fromJson(response.data);
  }
}
