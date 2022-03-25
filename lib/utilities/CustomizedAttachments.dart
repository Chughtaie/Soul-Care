import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Widgets/location.dart';
import 'package:flash_chat/utilities/Attachments.dart';
import 'package:flutter/material.dart';

Attachment selectedAttachment = attachments.first;
final _fireStore = FirebaseFirestore.instance;

/*
Widget getMessageItems() {
  List<DropdownMenuItem<Attachment>> dropDownList = [];
  for (Attachment myItem in attachments) {
    dropDownList.add(
      DropdownMenuItem(
        child: myItem.icon,
        value: myItem,
        alignment: Alignment.center,
      ),
    );
  }
  return DropdownButton<Attachment>(
    focusColor: Colors.lime,
    iconSize: 40,
    icon: Icon(Icons.attachment_rounded),
    iconDisabledColor: Colors.black,
    iconEnabledColor: Colors.black,
    underline: SizedBox(),
    items: dropDownList,
    dropdownColor: Colors.teal[100],
    borderRadius: BorderRadius.all(Radius.elliptical(40, 30)),
    elevation: 2,
    onChanged: (values) {
      //setState(() {
      selectedAttachment = values;
      //});
    },
  );
}*/

User loginUser;
String opening;
Widget attachmentButton(Attachment item) {
  return ElevatedButton(
    onPressed: () async {
      Location location = Location();
      await location.getLocation();
      //  setState(() {
      //  messagetextController.clear();

      _fireStore.collection(opening).add({
        'data': GeoPoint(location.latitude, location.longitude),
        'sender': loginUser.email,
        'time': Timestamp.now()
      });
      //  });
    },

    child: item.icon,
    style: ElevatedButton.styleFrom(
      elevation: 30,
      shape: CircleBorder(),
      minimumSize: const Size(50, 80),
      primary: item.backColor,
    ),
    //shape: CircleBorder(),
  );
}

Widget attachmentRows() {
  List<ElevatedButton> attachedButton = [];
  attachments.forEach((element) {
    attachedButton.add(attachmentButton(element));
  });

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: attachedButton.sublist(0, 2),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: attachedButton.sublist(2, 4),
      ),
    ],
  );
}

Widget attachmentBottomDropDown(
    BuildContext context, String opened, User loggedin) {
  loginUser = loggedin;
  opening = opened;

  return Container(
    height: 230,
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.vertical(top: Radius.elliptical(40, 20)),
    ),
    child: attachmentRows(),
  );
}
