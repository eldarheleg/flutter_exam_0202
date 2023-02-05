import 'package:flutter/material.dart';
import 'package:flutter_exam_0202/app/data/const.dart';
import 'package:flutter_exam_0202/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../../../data/autobuska_stanica.dart';
import '../controllers/timetable_controller.dart';

class TimetableView extends GetView<TimetableController> {
  TimetableView({Key? key}) : super(key: key);
  //LoginController loginController = Get.find();
  LoginController loginController = Get.put(LoginController());
  List<AutobuskaStanica> stanice = [
    AutobuskaStanica(
        id: 1,
        grad: "Jajce",
        kratkiOpis:
            "Duis vestibulum elit vel neque pharetra vulputate. Quisque scelerisque nisi urna. Duis rutrum non risus in imperdiet.",
        slika: "assets/images/jajce.jpg",
        dugiOpis:
            "+-------------+---------------------+---------+---------+\n| Broj linije |       Relacija      | Polazak | Dolazak |\n+-------------+---------------------+---------+---------+\n| 720         | Čapljina – Sarajevo | 06.09   | 08:35   |\n+-------------+---------------------+---------+---------+\n| 723         | Sarajevo – Čapljina | 07:15   | 09:37   |\n+-------------+---------------------+---------+---------+\n| 722         | Čapljina – Sarajevo | 16:42   | 19:04   |\n+-------------+---------------------+---------+---------+\n| 721         | Sarajevo – Čapljina | 16:49   | 19:15   |\n+-------------+---------------------+---------+---------+\n| 2400        | Konjic – Sarajevo   | 05:25   | 06:51   |\n+-------------+---------------------+---------+---------+\n| 2401        | Sarajevo – Konjic   | 15:48   | 17:14   |\n+-------------+---------------------+---------+---------+",
        cijenaPoKm: 1.0,
        longitude: 17.27059,
        latitude: 44.34203),
    AutobuskaStanica(
        id: 2,
        grad: "Banja Luka",
        kratkiOpis:
            "Duis vestibulum elit vel neque pharetra vulputate. Quisque scelerisque nisi urna. Duis rutrum non risus in imperdiet.",
        slika: "assets/images/banjaluka.png",
        dugiOpis:
            "+-------------+---------------------+---------+---------+\n| Broj linije |       Relacija      | Polazak | Dolazak |\n+-------------+---------------------+---------+---------+\n| 720         | Čapljina – Sarajevo | 06.09   | 08:35   |\n+-------------+---------------------+---------+---------+\n| 723         | Sarajevo – Čapljina | 07:15   | 09:37   |\n+-------------+---------------------+---------+---------+\n| 722         | Čapljina – Sarajevo | 16:42   | 19:04   |\n+-------------+---------------------+---------+---------+\n| 721         | Sarajevo – Čapljina | 16:49   | 19:15   |\n+-------------+---------------------+---------+---------+\n| 2400        | Konjic – Sarajevo   | 05:25   | 06:51   |\n+-------------+---------------------+---------+---------+\n| 2401        | Sarajevo – Konjic   | 15:48   | 17:14   |\n+-------------+---------------------+---------+---------+",
        cijenaPoKm: 1.0,
        longitude: 17.191000,
        latitude: 44.772182),
    AutobuskaStanica(
        id: 3,
        grad: "Travnik",
        kratkiOpis:
            "Duis vestibulum elit vel neque pharetra vulputate. Quisque scelerisque nisi urna. Duis rutrum non risus in imperdiet.",
        slika: "assets/images/travnik.jpg",
        dugiOpis:
            "+-------------+---------------------+---------+---------+\n| Broj linije |       Relacija      | Polazak | Dolazak |\n+-------------+---------------------+---------+---------+\n| 720         | Čapljina – Sarajevo | 06.09   | 08:35   |\n+-------------+---------------------+---------+---------+\n| 723         | Sarajevo – Čapljina | 07:15   | 09:37   |\n+-------------+---------------------+---------+---------+\n| 722         | Čapljina – Sarajevo | 16:42   | 19:04   |\n+-------------+---------------------+---------+---------+\n| 721         | Sarajevo – Čapljina | 16:49   | 19:15   |\n+-------------+---------------------+---------+---------+\n| 2400        | Konjic – Sarajevo   | 05:25   | 06:51   |\n+-------------+---------------------+---------+---------+\n| 2401        | Sarajevo – Konjic   | 15:48   | 17:14   |\n+-------------+---------------------+---------+---------+",
        cijenaPoKm: 1.0,
        longitude: 17.66583,
        latitude: 44.22637),
    AutobuskaStanica(
        id: 4,
        grad: "Sarajevo",
        kratkiOpis:
            "Duis vestibulum elit vel neque pharetra vulputate. Quisque scelerisque nisi urna. Duis rutrum non risus in imperdiet.",
        slika: "assets/images/sarajevo.jpg",
        dugiOpis:
            "+-------------+---------------------+---------+---------+\n| Broj linije |       Relacija      | Polazak | Dolazak |\n+-------------+---------------------+---------+---------+\n| 720         | Čapljina – Sarajevo | 06.09   | 08:35   |\n+-------------+---------------------+---------+---------+\n| 723         | Sarajevo – Čapljina | 07:15   | 09:37   |\n+-------------+---------------------+---------+---------+\n| 722         | Čapljina – Sarajevo | 16:42   | 19:04   |\n+-------------+---------------------+---------+---------+\n| 721         | Sarajevo – Čapljina | 16:49   | 19:15   |\n+-------------+---------------------+---------+---------+\n| 2400        | Konjic – Sarajevo   | 05:25   | 06:51   |\n+-------------+---------------------+---------+---------+\n| 2401        | Sarajevo – Konjic   | 15:48   | 17:14   |\n+-------------+---------------------+---------+---------+",
        cijenaPoKm: 1.0,
        longitude: 18.413029,
        latitude: 43.856430),
    AutobuskaStanica(
        id: 5,
        grad: "Bihać",
        kratkiOpis:
            "Duis vestibulum elit vel neque pharetra vulputate. Quisque scelerisque nisi urna. Duis rutrum non risus in imperdiet.",
        slika: "assets/images/bihac.jpg",
        dugiOpis:
            "+-------------+---------------------+---------+---------+\n| Broj linije |       Relacija      | Polazak | Dolazak |\n+-------------+---------------------+---------+---------+\n| 720         | Čapljina – Sarajevo | 06.09   | 08:35   |\n+-------------+---------------------+---------+---------+\n| 723         | Sarajevo – Čapljina | 07:15   | 09:37   |\n+-------------+---------------------+---------+---------+\n| 722         | Čapljina – Sarajevo | 16:42   | 19:04   |\n+-------------+---------------------+---------+---------+\n| 721         | Sarajevo – Čapljina | 16:49   | 19:15   |\n+-------------+---------------------+---------+---------+\n| 2400        | Konjic – Sarajevo   | 05:25   | 06:51   |\n+-------------+---------------------+---------+---------+\n| 2401        | Sarajevo – Konjic   | 15:48   | 17:14   |\n+-------------+---------------------+---------+---------+",
        cijenaPoKm: 1.0,
        longitude: 15.868565,
        latitude: 44.811962),
  ];
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
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "RED VOZNJE",
                            style: TextStyle(color: Colors.red, fontSize: 22),
                          ),
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
                      width: width * 6 / 7,
                      child: ListView.builder(
                        itemCount: stanice.length,
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          padding: EdgeInsets.zero,
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
                                SizedBox(width: 10,),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(stanice[index].grad,style: TextStyle(fontSize: 22),),
                                        SizedBox(height: 5,),
                                        Text(stanice[index].kratkiOpis),
                                      ],
                                    ))
                              ],
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
                          const Text(
                            "Unesite broj putnika:",
                            style: TextStyle(color: whiteColor, fontSize: 32),
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
                                SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: 150,
                                    child: const TextField(
                                      scrollPadding:
                                          EdgeInsets.only(bottom: 40),
                                      decoration: InputDecoration(),
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
                                SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: 150,
                                    child: const TextField(
                                      decoration: InputDecoration(),
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
                                  "Renzioner",
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 32),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    color: whiteColor,
                                    width: 150,
                                    child: const TextField(
                                      decoration: InputDecoration(),
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
