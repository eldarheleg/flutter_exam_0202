import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_exam_0202/app/data/user.dart';
import 'package:flutter_exam_0202/app/modules/timetable/views/timetable_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  login() {
    User user = User(emailController.text, passController.text);

    if (user.email.isEmpty || user.password.isEmpty) {
      Get.snackbar(":(", "");
    } else {
      if (user.email.contains('eldar') && user.password.contains('heleg')) {
        Get.offAll(TimetableView(), transition: Transition.fadeIn);
      } else {
        Get.snackbar(":(", "Something went wrong");
      }
    }
  }

  // getCurrentLocation() {
  //   Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     lat.value = position.latitude;
  //     long.value = position.longitude;
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(":(", "Loacation is turned off");
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      lat.value = position.latitude;
      long.value = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
