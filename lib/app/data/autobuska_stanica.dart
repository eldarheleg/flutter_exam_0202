import 'package:flutter/material.dart';

class AutobuskaStanica {
  int id = 0;
  String grad = "";
  String kratkiOpis = "";
  String slika = "";
  String dugiOpis = "";
  double cijenaPoKm = 0.0;
  double longitude = 0.0;
  double latitude = 0.0;

  AutobuskaStanica({
    required this.id,
    required this.grad,
    required this.kratkiOpis,
    required this.slika,
    required this.dugiOpis,
    required this.cijenaPoKm,
    required this.longitude,
    required this.latitude
  });
}
