import 'package:g62_find_home/app/data/models/request/request_authentication_model.dart';
import 'package:g62_find_home/app/data/models/response/response_authentication_model.dart';
import 'package:g62_find_home/app/data/providers/authentication_provider.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final _apiProvider = Get.find<AuthenticationProvider>();

  Future<ResponseAuthenticationModel> authentication(
    RequestAuthenticationModel request,
  ) =>
      _apiProvider.authentication(request);
}
