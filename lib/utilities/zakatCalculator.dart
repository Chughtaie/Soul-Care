import 'dart:collection';

import 'package:flash_chat/utilities/commodities.dart';
import 'package:flutter/material.dart';

class ZakatCalculator {
  List<Comodity> comodities = [];

  List<Comodity> getComodities() {
    return comodities;
  }

  void addComodity(Comodity comodity) {
    comodities.add(comodity);
  }

  double calZakat() {
    double zakat = 0;
    for (Comodity i in comodities) zakat += i.getValue();
    return zakat * 0.025;
  }
}
