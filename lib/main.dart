import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/how_to_use.dart';
import 'package:santika_chatbot_v2/aboutapp.dart';
import 'package:santika_chatbot_v2/chatbot.dart';
import 'package:santika_chatbot_v2/home.dart';
import 'package:santika_chatbot_v2/splash_screen.dart';

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