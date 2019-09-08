import 'package:flutter/material.dart';

class Chips extends StatelessWidget {

  final Function onTap;
  final String text;

  Chips({this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: this.onTap,
      child: new Container(
        //width: width/3,
        padding: new EdgeInsets.all(8.0),
        margin: new EdgeInsets.only(right: 4.0, left: 4.0),
        decoration: new BoxDecoration(
          color: Color(0xFFDFDFDF),
          borderRadius: new BorderRadius.circular(50.0),
        ),
        child: new Text(
          this.text,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
