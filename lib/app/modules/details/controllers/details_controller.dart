import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../data/podaci.dart';
import '../../login/controllers/login_controller.dart';

class DetailsController extends GetxController {
  LoginController loginC = Get.find();

  RxDouble udalj = 0.0.obs;

  kalkulacija(int index) {
    double udaljenost = 0.0;
    print("lat ${loginC.lat}");
    print("lat ${stanice[index].latitude}");
    print("lat ${loginC.long}");
    print("lat ${stanice[index].longitude}");
    udaljenost = Geolocator.distanceBetween(loginC.lat, loginC.long,
        stanice[index].latitude, stanice[index].longitude);
    print(udaljenost);
    udalj.value = udaljenost;
  }
}
