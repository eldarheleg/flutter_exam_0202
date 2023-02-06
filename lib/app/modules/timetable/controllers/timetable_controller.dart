import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../data/podaci.dart';
import '../../login/controllers/login_controller.dart';

class TimetableController extends GetxController {
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
  }
  TextEditingController odrasli = TextEditingController(text: 0.toString());
  TextEditingController djeca = TextEditingController(text: 0.toString());
  TextEditingController penzioneri = TextEditingController(text: 0.toString());

}
