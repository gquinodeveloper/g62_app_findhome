import 'package:g62_find_home/app/data/models/request/request_user_model.dart';
import 'package:g62_find_home/app/data/models/response/response_user_information_model.dart';
import 'package:g62_find_home/app/data/models/response/response_user_model.dart';
import 'package:g62_find_home/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<ResponseUserModel> postUserInsert(RequestUserModel request) =>
      _apiProvider.postUserInsert(request);

  Future<ResponseUserInformationModel> getUserInformation() =>
      _apiProvider.getUserInformation();
}
