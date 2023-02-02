import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_exam_0202/app/data/user.dart';
import 'package:flutter_exam_0202/app/modules/timetable/views/timetable_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Position? currentPosition;
  //RxDouble lan = currentPosition!.latitude.obs;

  login() {
    User user = User(emailController.text, passController.text);

    if (user.email.isEmpty || user.password.isEmpty) {
      Get.snackbar(":(", "");
    } else {
      if (user.email.contains('eldar') && user.password.contains('heleg')) {
        Get.offAll(TimetableView(), transition: Transition.fadeIn);
      } else {
        Get.snackbar(":(", "");
      }
    }
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentPosition = position;
      update();
      
    }).catchError((e) {
      print(e);
    });
  }
}
