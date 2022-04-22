import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

final fireStore = FirebaseFirestore.instance;

class _ZakatState extends State<Zakat> {
  ZakatCalculator zakat = new ZakatCalculator();
  List<String> comms = ["Gold", "Silver", "Plot", "Money", "Other"];
  var dropdownValue = "Gold";
  String name = "Gold";
  String oname;
  String price = "";
  String units;
  String pricePerUnit;
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    var _controller1 = TextEditingController();
    var _controller2 = TextEditingController();
    var _controller3 = TextEditingController();
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Zakat Calculator",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 235, 35, 185)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Commodity Type",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color.fromARGB(255, 74, 238, 74)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 218, 25, 83), fontSize: 20),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      //print(name + newValue);
                      setState(() {
                        dropdownValue = newValue;
                        name = newValue;
                        print(name);
                      });
                    },
                    items: comms.map<DropdownMenuItem<String>>((String myval) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          //print("MY Value");
                        },
                        value: myval.toString(),
                        child: Text(myval),
                      );
                    }).toList(),
                  ),
                ],
              ),
              if (dropdownValue == "Other")
                SizedBox(
                  height: 30,
                ),
              if (dropdownValue == "Other")
                CustomComodity(
                  hint: "Other Item",
                  controller: _controller,
                  onChange: (String val) {
                    oname = val;
                  },
                ),
              SizedBox(height: 20),
              CustomComodity(
                controller: _controller2,
                name: " Price Per Unit",
                hint: "150000 ( Rs. )",
                onChange: (String val) {
                  pricePerUnit = (val);
                },
              ),
              SizedBox(height: 20),
              CustomComodity(
                controller: _controller3,
                name: "Available Units",
                hint: "7.5 ( Tola / Unused Cars )",
                onChange: (String val) {
                  units = (val);
                },
              ),
              SizedBox(height: 20),
              Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  color: Colors.cyan,
                  child: Text(
                    "Price = " + zakat.calZakat().toString(),
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 60, 21, 235)),
                  )),
              SizedBox(height: 20),
              RoundButtons(
                colr: Colors.black,
                onPressed: () async {
                  //await writeFile("Gold 7.5\nSilver 52\n");
                  //String value = await (readFile());
                  //print(value);
                  print("MYYBCDBs");
                  Comodity comodity;
                  bool val = true;
                  try {
                    print("lol");
                    print(name);
                    var snapshot = fireStore.collection('Nisaab').doc(name);
                    //snapshots();
                    String nisaab;
                    await snapshot
                        //.doc(name)
                        .get()
                        .then((value) => nisaab = (value['nisaab']));

                    comodity = new Comodity(
                      name: name == "Other" ? oname : name,
                      nisaab: double.parse(nisaab),
                      pricePerUnit: double.parse(pricePerUnit),
                      units: double.parse(units),
                    );
                  } catch (NumberFormatException) {
                    print("Database Error");
                    val = false;
                  }
                  if (val) {
                    setState(() {
                      //writeFile("Gold 7.5\nSilver 52\n");

                      zakat.addComodity(comodity);
                      _controller.clear();
                      _controller1.clear();
                      _controller2.clear();
                      _controller3.clear();
                    });
                  }
                },
                text: "Enter the Commodity ",
              ),
              if (zakat.getComodities().length > 0)
                Expanded(
                  child: ListView.builder(
                    itemCount: zakat.getComodities().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          zakat.getComodities()[index].name +
                              '\t\t' +
                              zakat
                                  .getComodities()[index]
                                  .getValue()
                                  .toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Payable Zakat = " +
                    (zakat.calZakat() * (0.025)).roundToDouble().toString(),
                style: TextStyle(fontSize: 30, color: Colors.amberAccent),
              ),
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
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
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
