import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/utilities/MessageBox.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //stream: _fireStore.collection('Chatting').snapshots(),
        builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.brown[600],
          ),
        );
      }
      {
        final messages = snapshot.data.docs.reversed;
        List<MessageBox> messageWidget = [];
        for (var message in messages) {
          final text = message['text'];
          final sender = message['sender'];
          final box = MessageBox(
              text: text,
              time: sender,
              own: loginUser.email == sender ? true : false);

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
