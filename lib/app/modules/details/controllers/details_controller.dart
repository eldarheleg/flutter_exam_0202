import 'package:flutter_exam_0202/app/modules/timetable/controllers/timetable_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../data/podaci.dart';
import '../../login/controllers/login_controller.dart';

class DetailsController extends GetxController {
  LoginController loginC = Get.find();
  TimetableController timetC = Get.find();

  RxDouble udalj = 0.0.obs;

  kalkulacijaUdaljenosti(int index) {
    double udaljenost = 0.0;
    if (loginC.loading.value) {
      return false;
    } else {
      udaljenost = Geolocator.distanceBetween(loginC.lat, loginC.long,
          stanice[index].latitude, stanice[index].longitude);
      print(udaljenost);
      udalj.value = udaljenost;
    }
  }

  RxDouble obicna = 0.0.obs;
  RxDouble djecija = 0.0.obs;
  RxDouble penzionerska = 0.0.obs;
  RxDouble ukupno = 0.0.obs;

  kalkulacijaCijenePojedinacno(int index) {
    int osobe;
    int dj;
    int pen;
    int udaljenostKm = (udalj.value / 1000).toPrecision(0).toInt();
    if (timetC.odrasli.text.isEmpty) {
      osobe = 0;
    }else{
      osobe = int.parse(timetC.odrasli.text);
    }
    if (timetC.djeca.text.isEmpty) {
      dj = 0;
    }else{
      dj = int.parse(timetC.djeca.text);
    }
    if (timetC.penzioneri.text.isEmpty) {
      pen = 0;
    }else{
      pen = int.parse(timetC.penzioneri.text);
    }
    obicna.value =
        (udaljenostKm.toDouble() * stanice[index].cijenaPoKm.toDouble()) *
            osobe.toDouble();
    djecija.value =
        ((udaljenostKm.toDouble() * stanice[index].cijenaPoKm.toDouble()) *
                dj.toDouble()) *
            0.3;
    penzionerska.value =
        ((udaljenostKm.toDouble() * stanice[index].cijenaPoKm.toDouble()) *
                pen.toDouble()) *
            0.5;
  }

  kalkulacijaCijeneUkupno() {
    ukupno.value = obicna.value + djecija.value + penzionerska.value;
  }
}
