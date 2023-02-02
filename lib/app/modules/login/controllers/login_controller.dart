import 'package:flutter/widgets.dart';
import 'package:flutter_exam_0202/app/modules/timetable/views/timetable_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  login() {
    String email = emailController.text;
    String password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(":(", "");
    } else {
      Get.offAll(TimetableView(), transition: Transition.fadeIn);
    }
  }
}
