import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../data/podaci.dart';
import '../../login/controllers/login_controller.dart';

class TimetableController extends GetxController {
  TextEditingController odrasli = TextEditingController();
  TextEditingController djeca = TextEditingController();
  TextEditingController penzioneri = TextEditingController();

  RxInt obicna = 0.obs;
  RxDouble djecija = 0.0.obs;
  RxDouble penzionerska = 0.0.obs;
  RxInt index = 0.obs;
  RxDouble ukupno = 0.0.obs;

  kalkulacija() {
    print(odrasli.text);
    //obicna.value = int.parse(odrasli.text);
    // djecija.value =
    //     double.parse(djeca.text) * stanice[index.value].cijenaPoKm * 0.7;
    // penzionerska.value = double.parse(penzioneri.text) *
    //     stanice[index.value].cijenaPoKm *
    //     0.5;
  }
}
