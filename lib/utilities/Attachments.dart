import 'package:flutter/material.dart';

class Attachment {
  const Attachment(this.name, this.icon, this.backColor); //, this.onPress);
  final String name;
  final Icon icon;
  final Color backColor;
  //final onPress;
}

const Iconsize = 45.0;
const List attachments = [
  const Attachment(
    'image',
    Icon(
      Icons.image,
      size: Iconsize,
      color: Colors.white,
    ),
    Colors.pinkAccent,
    //onPress(){ }
  ),
  const Attachment(
    'location_pin',
    Icon(
      Icons.location_pin,
      size: Iconsize,
      color: Colors.red,
    ),
    Colors.white,
  ),
  const Attachment(
    'document',
    Icon(
      Icons.document_scanner_rounded,
      size: Iconsize,
      color: Colors.lightBlueAccent,
    ),
    Colors.teal,
  ),
  const Attachment(
    'audio',
    Icon(
      Icons.audiotrack,
      size: Iconsize,
      color: Colors.purple,
    ),
    Colors.redAccent,
  ),
];
