import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
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
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/podloga3.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Positioned(
                top: 100,
                child: Container(
                  height: 100,
                  width: width,
                  decoration: const BoxDecoration(color: whiteColor),
                  child: const Center(
                    child: Text(
                      "PRIJAVA",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.1, -0.1),
                child: Container(
                  height: 300,
                  width: width,
                  decoration: const BoxDecoration(color: whiteColor),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        TextField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                              hintText: "Email", suffixIcon: Icon(Icons.mail)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextField(
                            controller: controller.passController,
                            decoration: const InputDecoration(
                                hintText: "Sifra", suffixIcon: Icon(Icons.key)))
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0.3),
                child: Container(
                  height: height * 0.06,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      loginController.login();
                      //loginController.getCurrentLocation();
                    },
                    child: const Text(
                      "Prijava",
                      style: TextStyle(fontSize: 20),
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
}
