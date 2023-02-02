import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
import 'package:flutter_exam_0202/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../controllers/timetable_controller.dart';

class TimetableView extends GetView<TimetableController> {
  TimetableView({Key? key}) : super(key: key);
  LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/podloga1.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              // Obx(() => Text(
              //     'Lat: ${loginController.currentPosition?.latitude}/n Long: ${loginController.currentPosition?.longitude}')),
                  Text('GetBuilder: ${loginController.currentPosition?.latitude}'),
                  if (loginController.currentPosition != null) Text(
              "LAT: ${loginController.currentPosition!.latitude}, LNG: ${loginController.currentPosition!.longitude}"
            ),
              
            ],
          ),
        ),
      ),
    );
  }
}
