import 'package:flutter/material.dart';
import 'package:santika_chatbot_v2/consts/color.dart';

class BershcaAppbar extends StatelessWidget with PreferredSizeWidget {

  final String title;
  final bool canBack;
  final bool withInfo;

  BershcaAppbar({this.title = "", this.canBack = false, this.withInfo = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: BershcaColors.gradient4,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  (this.canBack) ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ) : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  (this.withInfo) ? IconButton(
                    icon: Icon(Icons.info_outline),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/about');
                    },
                  ) : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
