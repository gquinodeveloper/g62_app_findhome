import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/data/respositories/house_repository.dart';
import 'package:g62_find_home/app/data/respositories/user_repository.dart';
import 'package:g62_find_home/app/services/local_storage_service.dart';
import 'package:g62_find_home/core/utils/keys.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
  final _houseRepository = Get.find<HouseRepository>();

  //Variables
  RxString userFullName = RxString("");
  RxList<House> houses = RxList([]);
  RxString address = RxString("");
  RxInt isSelectedIndex = RxInt(0);

  //Functions
  void _initialize() async {
    final response = await _userRepository.getUserInformation();
    userFullName.value = "${response.name}";
    address.value = "${response.address}";

    //Get houses
    final responseHouse = await _houseRepository.getHouses();
    houses.value = responseHouse.result ?? [];
  }

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }
}
