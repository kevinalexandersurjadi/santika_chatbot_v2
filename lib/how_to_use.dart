import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/color.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class HowtoUseScreen extends StatefulWidget {
  @override
  _HowtoUseScreenState createState() => _HowtoUseScreenState();
}

class _HowtoUseScreenState extends State<HowtoUseScreen> {

  int _slideIndex = 0;
  final _itemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to Use',
          style: TextStyle(
            fontFamily: 'Montserrat'
          ),
        ),
        backgroundColor: BershcaColors.greenHarmony,
      ),
      body: TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
        },
        loop: false,
        itemCount: _itemCount,
        controller: IndexController(),
        transformer: PageTransformerBuilder(
          builder: (Widget child, TransformInfo info) {
            return Material(
              child: Center(
                child: Text('Page ${info.index}'),
              ),
            );
          }
        ),
      )
    );

    /**
     * OLD STYLE
     */
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'How To Use App'
//        ),
//        backgroundColor: Colors.black,
//      ),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        //crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
////          Container(
////            padding: new EdgeInsets.all(10.0),
////            margin: new EdgeInsets.all(10.0),
////            child: Image(image: AssetImage('assets/logo_umn.png')),
////          ),
//          Container(
//            padding: new EdgeInsets.only(top: 30.0),
//            //Padding(padding: EdgeInsets.only(top: 10.0),
//            margin: new EdgeInsets.all(20.0),
//            child: Text(
//              'Pada menu utama terdapat 3 button yang dapat ditekan.\n'
//                  '\n'
//                  '1. Chat Bot:\n'
//                  '- Fitur utama dari aplikasi yang menyediakan Artificial Intelligence untuk melakukan automasi pelayanan customer service Aplikasi Mysantika.\n\n'
//                  '- Dalam Halaman ini, user dapat melakukan chatting dengan Berscha Bot untuk bertanya mengenai Hotel Santika Premier Slipi.\n\n'
//                  '2. How To Use App:\n'
//                  '- Pada halaman ini, terdapat informasi mengenai cara penggunaan aplikasi dari Berscha Bot.\n\n'
//                  '3. About App:\n'
//                  '- Halaman ini berisi penjelasan singkat mengenai Berscha Bot.',
//              textAlign: TextAlign.center,
//            ),
//          ),
//        ],
//      ),
//      // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }
}