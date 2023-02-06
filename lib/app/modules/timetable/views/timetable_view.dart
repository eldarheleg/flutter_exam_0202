import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
import 'package:flutter_exam_0202/app/modules/details/controllers/details_controller.dart';
import 'package:flutter_exam_0202/app/modules/details/views/details_view.dart';
import 'package:flutter_exam_0202/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../../../data/autobuska_stanica.dart';
import '../../../data/podaci.dart';
import '../controllers/timetable_controller.dart';

class TimetableView extends GetView<TimetableController> {
  TimetableView({Key? key}) : super(key: key);
  DetailsController detailsController = Get.put(DetailsController(),permanent: true);
  TimetableController timetableController = Get.put(TimetableController());

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
                        children: [
                          Text(
                            "RED VOZNJE",
                            style: TextStyle(color: Colors.red, fontSize: 22),
                          ),
                          //Text(loginController.lat.toString()),
                          Icon(Icons.menu)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      height: 50,
                      width: width * 4 / 5,
                      child: const TextField(
                        style: TextStyle(fontSize: 26),
                        textAlignVertical: TextAlignVertical.center,
                        scrollPadding: EdgeInsets.only(bottom: 40),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pretraga odredista",
                            hintStyle: TextStyle(fontSize: 26),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(Icons.mic)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 500,
                      width: width,
                      child: ListView.builder(
                        itemCount: stanice.length,
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          padding: EdgeInsets.zero,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => DetailsView(), arguments: index);
                              timetableController.index.value = index;
                              detailsController.kalkulacija(index);
                            },
                            child: Card(
                              elevation: 5,
                              //margin: EdgeInsets.zero,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      width: width,
                                      height: height,
                                      stanice[index].slika,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            stanice[index].grad,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(stanice[index].kratkiOpis),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Unesite broj putnika:",
                              style: TextStyle(color: whiteColor, fontSize: 32),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "Odrasli",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: width * 1 / 2,
                                    child: TextField(
                                      controller: timetableController.odrasli,
                                      style: TextStyle(fontSize: 26),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                    ),
                                  ),
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
                                  "Djeca",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: width * 1 / 2,
                                    child: TextField(
                                      controller: timetableController.djeca,
                                      style: TextStyle(fontSize: 26),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                    ),
                                  ),
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
                                  "Penzioner",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: width * 1 / 2,
                                    child: TextField(
                                      controller:
                                          timetableController.penzioneri,
                                      style: TextStyle(fontSize: 26),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                    ),
                                  ),
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
