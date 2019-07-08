import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/color.dart';

class BershcaButton extends StatelessWidget {

  final Function onPressed;
  final Color color;
  final String text;
  final Color textColor;

  BershcaButton({@required this.onPressed, this.color = BershcaColors.purpleHighTech, @required this.text, this.textColor = Colors.white});
  /// Alternative
  /// BershcaButton({@required this.onPressed, this.color = BershcaColors.brownWarm, @required this.text, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: RaisedButton(
          onPressed: onPressed,
          color: color,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.all(
                  Radius.circular(50.0)
              )
          ),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: textColor
            ),
          )
      ),
    );
  }
}
