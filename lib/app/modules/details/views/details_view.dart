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
  LoginController loginC = Get.find();
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
                        height: 60,
                        width: width * 4 / 5,
                        child: FittedBox(
                          child: Text(
                            stanice[index].grad + ", Bosna i Hercegovina",
                            style: const TextStyle(fontSize: 32),
                          ),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: width * 4 / 5,
                      child: loginC.loading.value
                          ? const CircularProgressIndicator()
                          : Obx(
                              () => Text(
                                "Udaljenost ${(controller.udalj.value / 1000).toPrecision(0).toInt()} Km",
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      width: width,
                      child: Image.asset(stanice[index].slika,fit: BoxFit.cover,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: width * 4 / 5,
                      child: FittedBox(
                        child: Text(
                          stanice[index].dugiOpis,
                          softWrap: true,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Kalkulacija cijene:",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 32,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Odrasli: ${timetableController.odrasli.text.isEmpty ? 0 : timetableController.odrasli.text} x ${stanice[index].cijenaPoKm * (controller.udalj.value / 1000).toPrecision(0).toInt()} = ${controller.obicna.value} KM",
                                  style: const TextStyle(
                                      color: whiteColor,
                                      fontSize: 28,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Djeca(70%): ${timetableController.djeca.text.isEmpty ? 0 : timetableController.djeca.text} x ${stanice[index].cijenaPoKm * (controller.udalj.value / 1000).toPrecision(0).toInt() * 0.3} = ${controller.djecija.value} KM",
                                    style: const TextStyle(
                                        color: whiteColor,
                                        fontSize: 28,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    child: Text(
                                      "Penzioner(50%): ${timetableController.penzioneri.text.isEmpty ? 0 : timetableController.penzioneri.text} x ${stanice[index].cijenaPoKm * (controller.udalj.value / 1000).toPrecision(0).toInt() * 0.5} = ${controller.penzionerska.value} KM",
                                      style: const TextStyle(
                                          color: whiteColor,
                                          fontSize: 28,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() => Text(
                                  '${controller.ukupno.value.toString()} KM',
                                  style: const TextStyle(
                                      fontSize: 32,
                                      color: blackColor,
                                      fontStyle: FontStyle.italic),
                                )),
                          ),
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Obavijest",
                                  middleText:
                                      "Vasa karta je placena. Zahvaljujemo sto putujete sa nama",
                                );
                              },
                              child: const Text(
                                "Plati",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: whiteColor,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
