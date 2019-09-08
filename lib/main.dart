import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/screens/about.dart';
import 'package:santika_chatbot_v2/screens/chatbot.dart';
import 'package:santika_chatbot_v2/screens/home.dart';
import 'package:santika_chatbot_v2/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/chat': (context) => ChatScreen(),
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
      },
      title: 'Bershca',
      theme: ThemeData(
        backgroundColor: Colors.grey,
        buttonColor: Color.fromARGB(255, 184, 50, 39), //
      ),
      home: SplashScreen(),
    );
  }
}