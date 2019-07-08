import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/color.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About This App',
          style: TextStyle(
            fontFamily: 'Montserrat'
          ),
        ),
        backgroundColor: BershcaColors.greenHarmony,
        elevation: 0.0,
      ),
      body: Container(
        color: BershcaColors.greenHarmony,
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset('assets/logo_umn.png'),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Color.fromARGB(255, 65, 57, 55),
                            child: Image.asset(
                              'assets/santika_2_2.png',
                              width: 64.0,
                              height: 64.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Bershca',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Bot ExpeRimental Santika Hotel Chat Assistant',
                      style: TextStyle(
                        fontFamily: 'Montserrat'
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'This chatbot app was made in collaboration between Santika Hotel and Universitas Multimedia Nusantara',
                      style: TextStyle(
                          fontFamily: 'Montserrat'
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
                  Text('Copyright, 2019 All Rights Reserved.',)
                ],
              )
            )
          ],
        ),
      ),
    );

    /**
     * OLD STYLE
     */
//    var assetImage = AssetImage('assets/santika_2_2.png');
//    var image = new Image(image: assetImage, width: 64.0, height: 64.0,);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'Tentang Aplikasi',
//          style: TextStyle(
//            fontFamily: 'Montserrat'
//          ),
//        ),
//        backgroundColor: BershcaColors.greenHarmony,
//        elevation:,
//      ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        //crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Container(
//            padding: new EdgeInsets.only(top: 60.0),
//          ),
//          Container(
//            padding: new EdgeInsets.all(10.0),
//            margin: new EdgeInsets.all(10.0),
//            child: Row(
//              children: <Widget>[
//                Expanded(child: Image(image: AssetImage('assets/logo_umn.png'))),
//                Text('X', style: TextStyle(fontSize: 24.0),),
//                //Expanded(child: Image(image: AssetImage('assets/santika_2_2.png'))),
//                Expanded(child:
//                  CircleAvatar(
//                    backgroundColor: Color.fromARGB(255, 65, 57, 55),
//                    radius: 50.0,
//                    child: image,
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            //padding: new EdgeInsets.only(top: 20.0),
//            margin: new EdgeInsets.all(20.0),
//            child: Text(
//              'Berscha Bot.\n'
//              'Singkatan dari Bot for ExpeRimental Santika Hotel Chat Assistant\n\n'
//              'Aplikasi Chatbot ini dibuat dengan kerjasama antara Hotel Santika dengan UMN\n',
//              textAlign: TextAlign.center,
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.all(20.0),
//            width: double.infinity,
//            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Icon(Icons.copyright, size: 12,),
//                SizedBox(width: 8.0,),
//                Text('Copyright 2019, All Rights Reserved.',)
//            ],),
//          )
//        ],
//      ),
//      // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}
