import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_exam_0202/app/data/user.dart';
import 'package:flutter_exam_0202/app/modules/timetable/views/timetable_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  double lat = 0.0;
  double long = 0.0;

  @override
  void onInit() {
    super.onInit();
  }

  login() {
    User user = User(emailController.text, passController.text);

    if (user.email.isEmpty || user.password.isEmpty) {
      Get.snackbar(":(", "");
    } else {
      if (user.email.contains('eldar') && user.password.contains('heleg')) {
        Get.to(()=>TimetableView(), transition: Transition.fadeIn);
      } else {
        Get.snackbar(":(", "Something went wrong");
      }
    }
  }

  RxBool loading = false.obs;

  Future<void> getCurrentLocation() async {
    loading.value = true;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(":(", "Loacation is turned off");
      loading.value = true;
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.checkPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .whenComplete(() => loading.value = false);
      print("fetching finished--------------------------------- ");
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
