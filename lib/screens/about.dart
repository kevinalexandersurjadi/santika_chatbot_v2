import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/assets.dart';
import 'package:santika_chatbot_v2/consts/color.dart';
import 'package:santika_chatbot_v2/widgets/appbar.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BershcaAppbar(
        title: 'Bershca Chat Room',
        canBack: true,
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        BershcaAssets.bershcaVertical6,
                        width: 180.0,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Bot ExpeRimental Santika Hotel Chat Assistant',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'This chatbot app was made in collaboration between Santika Hotel and Universitas Multimedia Nusantara',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.copyright, size: 12,),
                    SizedBox(width: 8.0,),
                    Text(
                      'Copyright, 2019 All Rights Reserved.',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
