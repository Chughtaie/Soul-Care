import 'dart:ffi';

class Comodity {
  final name;

  double price;
  double units;
  double pricePerUnit;

  Comodity({this.price = 1, this.name, this.pricePerUnit = 1, this.units = 1});

  double getValue() {
    if (price == 0)
      return units * pricePerUnit;
    else
      return price;
  }
}
