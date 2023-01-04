import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
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

  //Variables

  //Functions

  void _initialize() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(RoutesName.LOGIN);
    });
  }
}
