import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:g62_find_home/app/data/models/request/request_user_model.dart';
import 'package:g62_find_home/app/data/respositories/user_repository.dart';
import 'package:g62_find_home/core/utils/popup_messages.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //Instances
  final _userRepository = Get.find<UserRepository>();

  //Variables
  RxBool isLoading = RxBool(false);

  //TextEditingController
  TextEditingController crtlTextName = TextEditingController();
  TextEditingController crtlTextLastName = TextEditingController();
  TextEditingController crtlTextAddress = TextEditingController();
  TextEditingController crtlTextEmail = TextEditingController();
  TextEditingController crtlTextPassword = TextEditingController();

  //Functions
  void _initialize() {}

  void registerCustomer() async {
    try {
      final response = await _userRepository.postUserInsert(
        RequestUserModel(
            name: crtlTextName.text.trim(),
            lastname: crtlTextLastName.text.trim(),
            adress: crtlTextAddress.text.trim(),
            email: crtlTextEmail.text.trim(),
            password: crtlTextPassword.text.trim()),
      );
      if (response.message != "") {
        _clearText();
        PopUpMessages.show(
          "${response.message}",
          title: "Success",
        );
      }
    } on DioError catch (error) {
      isLoading.value = false;
      PopUpMessages.show(
        error.response?.data["message"],
        title: error.error,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _clearText() {
    crtlTextName.clear();
    crtlTextLastName.clear();
    crtlTextAddress.clear();
    crtlTextEmail.clear();
    crtlTextPassword.clear();
  }
}
