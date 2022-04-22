import 'dart:ffi';

class Comodity {
  final String name;

  double units;
  double pricePerUnit;
  double nisaab;
  Comodity(
      {this.name = "Item",
      this.pricePerUnit = 1,
      this.units = 1,
      this.nisaab = 1});

  double getValue() {
    //print(units + nisaab + pricePerUnit);
    double val = (units - nisaab);
    return (val < 0 ? 0 : val) * pricePerUnit;
  }
}
