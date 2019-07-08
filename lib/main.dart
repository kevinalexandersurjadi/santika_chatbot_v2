import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/screens/how_to_use.dart';
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
        '/home': (context) => HomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/howto': (context) => HowtoUseScreen(),
        '/about': (context) => AboutScreen(),
      },
      title: 'Bershca',
      theme: ThemeData(
        //primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.grey,
//        buttonColor: Color.fromARGB(255, 127, 255, 212), //aquamarine
        buttonColor: Color.fromARGB(255, 184, 50, 39), //
      ),
      home: SplashScreen(),
    );
  }
}