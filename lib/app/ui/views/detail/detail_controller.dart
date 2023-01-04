import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g62_find_home/app/data/models/request/request_reservation_model.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/data/respositories/house_repository.dart';
import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/services/local_storage_service.dart';
import 'package:g62_find_home/core/utils/keys.dart';
import 'package:g62_find_home/core/utils/popup_messages.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
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
  final _houseRepository = Get.find<HouseRepository>();
  House house = House();

  //Variables
  TextEditingController crtTextDate = TextEditingController();

  //Functions
  void _initialize() async {
    house = Get.arguments as House;
  }

  void reservation() async {
    try {
      final response = await _houseRepository.postInsertReservation(
        RequestReservationModel(
          idUser: await LocalStorageService.get(key: Keys.kIdUser),
          idHouse: house.idHouse ?? 0,
          date: crtTextDate.text,
          price: house.price ?? 0,
        ),
      );
      Get.back();
      if (response != "") {
        PopUpMessages.show(
          response,
          title: "Success",
          onTapButtonDialog: (){
            Get.offNamed(RoutesName.HOME);
          },
        );
      }
    } on DioError catch (error) {
      PopUpMessages.show(
        error.response?.data["message"],
        title: error.error,
      );
    }
  }
}
