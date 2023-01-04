import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:g62_find_home/app/data/models/request/request_authentication_model.dart';
import 'package:g62_find_home/app/data/respositories/authentication_repository.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/services/local_storage_service.dart';
import 'package:g62_find_home/core/utils/keys.dart';
import 'package:g62_find_home/core/utils/popup_messages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  //Variables
  RxBool isLoading = RxBool(false);
  RxBool isObscureText = RxBool(false);

  RxString errorTextEmail = RxString("");
  RxString errorTextPassword = RxString("");

  //TextEditingController
  TextEditingController ctrlTextEmail = TextEditingController();
  TextEditingController ctrlTextPassword = TextEditingController();

  //Functions

  void _initialize() {
    /*    ctrlTextEmail.text = "danielgallo@gmail.com";
    ctrlTextPassword.text = "123"; */
  }

  void showPassword() {
    isObscureText.value = !isObscureText.value;
  }

  void doAuthentication() async {
    try {
      isLoading.value = true;

      bool validateEmail = GetUtils.isEmail(ctrlTextEmail.text);
      bool validatePassword = ctrlTextPassword.text.isNotEmpty;
      errorTextEmail.value =
          validateEmail ? "" : 'Ingrese un correo electrónico válido';
      errorTextPassword.value = validatePassword ? "" : 'Ingrese su contraseña';

      if (validateEmail && validatePassword) {
        final email = ctrlTextEmail.text;
        final password = ctrlTextPassword.text;

        final response = await _authenticationRepository.authentication(
          RequestAuthenticationModel(
            email: email,
            password: password,
          ),
        );
        if (response.success == true) {
          await LocalStorageService.set(
            key: Keys.kToken,
            value: response.requestToken ?? "",
          );

          await LocalStorageService.set(
            key: Keys.kIdUser,
            value: response.idUser ?? "",
          );

          isLoading.value = false;
          Get.offNamed(RoutesName.HOME);
        }
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
}
