import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../../../data/const.dart';
import '../../../data/podaci.dart';
import '../../timetable/controllers/timetable_controller.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({Key? key}) : super(key: key);
  int index = Get.arguments;

  //final timetableController = Get.find<TimetableController>();
  TimetableController timetableController = Get.put(TimetableController());
  //DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/podloga4.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              //physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "CIJENA VOZNJE",
                            style: TextStyle(color: Colors.red, fontSize: 22),
                          ),
                          Icon(Icons.menu)
                        ],
                      ),
                    ),
                    Container(
                        height: 100,
                        width: width * 4 / 5,
                        child: Text(
                          stanice[index].grad + ", Bosna i Hercegovina",
                          style: TextStyle(fontSize: 32),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        width: width * 4 / 5,
                        child: Obx(() => Text(
                              "Udaljenost ${(controller.udalj.value/1000).toPrecision(0).toInt()} Km",
                              style: TextStyle(fontSize: 32),
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Kalkulacija cijene:",
                              style: TextStyle(color: whiteColor, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${controller.udalj.value/1000}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Djeca (70%):",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Penzioner (50%)",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
