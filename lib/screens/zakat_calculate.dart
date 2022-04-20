import 'package:flash_chat/Widgets/Rounded_buttons.dart';
import 'package:flash_chat/utilities/commodities.dart';
import 'package:flash_chat/utilities/zakatCalculator.dart';
import 'package:flutter/material.dart';

import 'text_field.dart';

class Zakat extends StatefulWidget {
  static const id = "Zakat_screen";

  Zakat();

  @override
  State<Zakat> createState() => _ZakatState();
}

class _ZakatState extends State<Zakat> {
  ZakatCalculator zakat = new ZakatCalculator();

  @override
  Widget build(BuildContext context) {
    String name;
    String price;
    String units;
    String pricePerUnit;
    var _controller = TextEditingController();
    var _controller1 = TextEditingController();
    var _controller2 = TextEditingController();
    var _controller3 = TextEditingController();
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomComodity(
                controller: _controller,
                onChange: (String val) {
                  name = val;
                },
              ),
              SizedBox(height: 20),
              CustomComodity(
                controller: _controller1,
                name: "Total Price",
                hint: "1000 (Rupee)",
                onChange: (String val) {
                  price = (val);
                },
              ),
              SizedBox(height: 20),
              CustomComodity(
                controller: _controller2,
                name: "Price Per Unit",
                hint: "150000 (Rupee)",
                onChange: (String val) {
                  pricePerUnit = (val);
                },
              ),
              SizedBox(height: 20),
              CustomComodity(
                controller: _controller3,
                name: "Units",
                hint: "7.5 (tola)",
                onChange: (String val) {
                  units = (val);
                },
              ),
              SizedBox(height: 20),
              RoundButtons(
                  colr: Colors.black,
                  onPressed: () {
                    Comodity comodity;
                    bool val = true;
                    try {
                      comodity = new Comodity(
                        name: name,
                        price: double.parse(price),
                        pricePerUnit: double.parse(pricePerUnit),
                        units: double.parse(units),
                      );
                    } catch (NumberFormatException) {
                      val = false;
                    }
                    if (val) {
                      setState(() {
                        zakat.addComodity(comodity);
                        _controller.clear();
                        _controller1.clear();
                        _controller2.clear();
                        _controller3.clear();
                      });
                    }
                  },
                  text: "Enter the Commodity "),
              Expanded(
                child: ListView.builder(
                  itemCount: zakat.getComodities().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        zakat.getComodities()[index].name +
                            '\t\t' +
                            zakat.getComodities()[index].getValue().toString(),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Payable Zakat = " + zakat.calZakat().toString())
            ],
          ),
        ),
      ),
    );
  }
}

class CustomComodity extends StatelessWidget {
  final String name;
  final String hint;
  final onChange;
  final controller;

  CustomComodity({
    this.name = "Name",
    this.hint = "Gold",
    this.onChange,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name),
        CustomTextField(
          controller: controller,
          hintText: hint,
          obscure: false,
          onChange: onChange,
        )
      ],
    );
  }
}
