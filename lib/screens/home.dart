import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/assets.dart';
import 'package:santika_chatbot_v2/consts/color.dart';
import 'package:santika_chatbot_v2/widgets/button.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: BershcaColors.gradient1,
            /// Alternative
            /// colors: BershcaColors.gradient5
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                BershcaAssets.bershcaVertical4,
                /// Alternative
                /// BershcaAssets.bershcaVertical4
                width: 180.0,
              ),
              SizedBox(
                height: 16.0,
              ),
              BershcaButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                },
                text: 'Start Chatting',
              ),
//              BershcaButton(
//                onPressed: () {
//                  Navigator.pushNamed(context, '/howto');
//                },
//                text: 'How to Use',
//              ),
              BershcaButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                text: 'About',
              ),
            ],
          ),
        ),
      ),
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