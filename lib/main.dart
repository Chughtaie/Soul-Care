import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/friend_screen.dart';
import 'package:flash_chat/screens/startScreen.dart';
import 'package:flash_chat/utilities/tasbeeh.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

import 'Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: lightMode.id,
      routes: {
        themeScreen.id: (context) => themeScreen(),
        home.id: (context) => home(),
        lightMode.id: (context) => lightMode(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Friend.id: (context) => Friend(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
