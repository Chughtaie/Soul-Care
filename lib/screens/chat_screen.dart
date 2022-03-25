import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/Database/firebase.dart';
import 'package:flash_chat/Widgets/Rounded_buttons.dart';
import 'package:flash_chat/Widgets/location.dart';
import 'package:flash_chat/utilities/Attachments.dart';
import 'package:flash_chat/utilities/CustomizedAttachments.dart';
import 'package:flash_chat/utilities/MessageBox.dart';
import 'package:flash_chat/utilities/NeoText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final _fireStore = FirebaseFirestore.instance;
final _fireStorage = FirebaseStorage.instance;

User loginUser;
String openEmail;
String opening;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagetextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String message;
  @override
  void initState() {
    super.initState();

    //getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loginUser = user;
        print('OpenedEmail = ' + openEmail);
        print('LoginEmail = ' + loginUser.email);
        openEmail.compareTo(loginUser.email) > 0
            ? opening = openEmail + loginUser.email
            : opening = loginUser.email + openEmail;
        print('opening = ' + opening);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) openEmail = arguments['email'];
    print('&&&&&&&' + openEmail);
    getCurrentUser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[],
        elevation: 30,
        title: Center(
          child: Text(
            '⚡️$openEmail',
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.blueGrey[600]),
                      controller: messagetextController,
                      onChanged: (value) {
                        //if (message != null)
                        //message += value;
                        //else
                        message = value;
                        print(message);
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    shape: CircleBorder(),
                    minWidth: 10,
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => attachmentBottomDropDown(
                            context, opening, loginUser),
                      );
                    },
                    child: Icon(
                      Icons.attachment_rounded,
                      color: Colors.black54,
                      size: 35,
                    ),
                  ),
                  /*
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getMessageItems(),
                  ),*/
                  FlatButton(
                    onPressed: () {
                      if (message != null) {
                        print('######' + opening);
                        messagetextController.clear();
                        _fireStore.collection(opening).add({
                          'data': message,
                          'sender': loginUser.email,
                          'time': Timestamp.now()
                        });
                      }
                      message = null;
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection(opening)
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.brown[600],
              ),
            );
          }
          {
            final messages = snapshot.data.docs;
            List<MessageBox> messageWidget = [];
            for (var message in messages) {
              print('Messages Opened = ' + opening);
              final text = message['data'];
              final time = message['time'];
              final sender = message['sender'];
              final box = MessageBox(
                text: text,
                time: time,
                own: sender == loginUser.email ? true : false,
              );
              messageWidget.add(box);
            }
            return Expanded(
              child: ListView(
                reverse: true,
                children: messageWidget,
              ),
            );
          }
        });
  }
}
