import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

final _auth = FirebaseAuth.instance;
final _fireStore = FirebaseFirestore.instance;
User loginUser;
List<String> existFrineds = [];

class Friend extends StatefulWidget {
  static const id = 'friend_screen';
  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  final messagetextController = TextEditingController();
  String addFriend;

  void getCurrentUser() {
    print('#################GGLLLLLLEEEEEESSSSSSS');
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loginUser = user;
      }
    } catch (e) {
      print('LLLLLOOOOOOGGGGGLLLLLLEEEEEESSSSSSS');
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white60),
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: Center(
          child: Text(
            '⚡️Friends',
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExistingsFriends(),
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
                      addFriend = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    messagetextController.clear();
                    if (addFriend != null) {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: addFriend, password: '1234');
                      } catch (e) {
                        if (e.toString().contains('no user')) {
                          print('invalid User');
                        } else {
                          print('**************************');

                          if (!existFrineds.contains(addFriend))
                            _fireStore.collection(_auth.currentUser.email).add(
                                {'friend': addFriend, 'time': Timestamp.now()});
                          else {
                            print('Already A Friend');
                          }
                          addFriend = null;
                        }
                      }
                    }
                  },
                  child: Text(
                    'Add',
                    style: kSendButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExistingsFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection(_auth.currentUser.email).snapshots(),
        builder: (context, snapshot) {
          //print(loginUser.email);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.brown[600],
              ),
            );
          }
          {
            final messages = snapshot.data.docs;
            List<ExistingFriendBox> friendsWidget = [];
            existFrineds = [];
            //for (var message in messages)
            {
              print('Friends of = ' + loginUser.email);

              for (var message in messages) {
                final email = message['friend'];
                existFrineds.add(email);
                final box = ExistingFriendBox(
                  email: email,
                );
                friendsWidget.add(box);
              }
            }
            return Expanded(
              child: ListView(
                reverse: true,
                children: friendsWidget,
              ),
            );
          }
        });
  }
}

class ExistingFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection(loginUser.email)
            .doc()
            .collection('friendList')
            .snapshots(),
        builder: (context, snapshot) {
          //print(loginUser.email);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.brown[600],
              ),
            );
          }
          {
            final messages = snapshot.data.docs;
            List<ExistingFriendBox> friendsWidget = [];
            existFrineds = [];
            for (var message in messages) {
              print('Friends of = ' + loginUser.email);

              final email = message['friend'];
              existFrineds.add(email);
              final box = ExistingFriendBox(
                email: email,
              );

              friendsWidget.add(box);
            }
            return Expanded(
              child: ListView(
                reverse: true,
                children: friendsWidget,
              ),
            );
          }
        });
  }
}

class ExistingFriendBox extends StatelessWidget {
  final email;

  ExistingFriendBox({this.email});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, ChatScreen.id,
            arguments: {'email': email});
      },
      child: Column(
        children: [
          Text(
            email,
            style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
          )
        ],
      ),
    );
  }
}
