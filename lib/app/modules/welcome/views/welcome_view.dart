// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
import 'package:flutter_exam_0202/app/modules/login/views/login_view.dart';
import 'package:flutter_exam_0202/app/modules/registration/views/registration_view.dart';
import 'package:flutter_exam_0202/app/modules/welcome/controllers/welcome_controller.dart';
// Package imports:
import 'package:get/get.dart';
// Project imports:

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
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
              Align(
                alignment: Alignment(0.1, 0.5),
                child: Container(
                  height: height * 0.06,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: logIn,
                    child: Text(
                      "Prijava",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment(0.1, 0.7),
                child: Container(
                  height: height * 0.06,
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: logIn,
                    child: Text(
                      "Registracija",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  height: 400,
                  width: width,
                  decoration: BoxDecoration(color: whiteColor),
                ),
              ),
              Positioned(
                top: 180,
                child: Container(
                  height: 200,
                  width: width*2/3,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  signUp() {
    Get.to(() => const RegistrationView(), transition: Transition.leftToRight);
  }

  logIn() {
    Get.to(() =>  LoginView(), transition: Transition.rightToLeft);
  }

}
