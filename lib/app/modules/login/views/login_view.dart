import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
import 'package:flutter_exam_0202/app/modules/registration/views/registration_view.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
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
          image: AssetImage('assets/images/podloga3.png'),
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
                  width: width,
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
                alignment: Alignment(0.1, 0.2),
                child: Container(
                  height: 400,
                  width: width,
                  decoration: BoxDecoration(color: whiteColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              hintText: "email", suffixIcon: Icon(Icons.mail)),
                        ),
                        TextField(
                            controller: controller.passController,
                            decoration: InputDecoration(hintText: "sifra"))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(color: whiteColor),
                  child: Center(
                    child: Text(
                      "PRIJAVA",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
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
    Get.to(() => LoginView(), transition: Transition.rightToLeft);
  }
}
