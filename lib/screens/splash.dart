import 'package:flutter/material.dart';

import 'package:santika_chatbot_v2/consts/color.dart';
import 'package:santika_chatbot_v2/consts/assets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, '/chat');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: BershcaColors.gradient1,
          )
        ),
        child: Center(
          child: Image.asset(BershcaAssets.bershcaHorizontal4),
        ),
      )
    );
  }


    /**
     * OLD STYLE
     */
//  @override
//  Widget build(BuildContext context) {
//    var assetImage = AssetImage('assets/santika_2_2.png');
//    //var assetImage = AssetImage('assets/logo_umn.png');
//    var image = new Image(image: assetImage, width: 64.0, height: 64.0,);
//
//    return new Scaffold(
//      body: Stack(
//          fit: StackFit.expand,
//          children: <Widget>[
//            Container(
//              decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
//            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        CircleAvatar(
//                          backgroundColor: Color.fromARGB(255, 65, 57, 55),
//                          radius: 50.0,
//                          child: image,
//                        ),
//                        Padding(padding: EdgeInsets.only(top: 10.0),
//                        ),
//                        Text(
//                          "Berscha Bot",
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 24.0,
//                              fontWeight: FontWeight.bold
//                          ),
//                        ),
//                        Padding(padding: new EdgeInsets.only(top: 50.0),),
//                        ButtonTheme(
//                          minWidth: 130.0,
//                          child: RaisedButton(
//                            shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.all(
//                                    Radius.circular(50.0)
//                                )
//                            ),
//                            child: new Text(
//                                "Chat Bot",
//                                style: TextStyle(
//                                    color: Colors.white
//                                )
//                            ),
//                            color: Theme.of(context).buttonColor,
//                            //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot())),
//                            onPressed: () =>
//                                Navigator.pushNamed(context, '/chat'),
//                          ),
//                        ), // ini how to use
//                        ButtonTheme(
//                          minWidth: 130.0,
//                          child: RaisedButton(
//                            shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.all(
//                                    Radius.circular(50.0)
//                                )
//                            ),
//                            child: new Text(
//                                "How To Use App",
//                                style: TextStyle(
//                                    color: Colors.white
//                                )
//                            ),
//                            color: Theme.of(context).buttonColor,
//                            //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot())),
//                            onPressed: () =>
//                                Navigator.pushNamed(context, '/howto'),
//                          ),
//                        ),
//                        ButtonTheme(
//                          minWidth: 130.0,
//                          child: RaisedButton(
//                            onPressed: () {
//                              print("About App button pressed");
//                              //Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
//                              Navigator.pushNamed(context, '/about');
//                            },
//                            color: Theme.of(context).buttonColor,
//                            shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.all(
//                                    Radius.circular(50.0)
//                                )
//                            ),
//                            child: new Text(
//                                "About This App",
//                                style: TextStyle(
//                                    color: Colors.white
//                                )
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ],
//            )
//          ]
//      ),
//    );
//  }
}