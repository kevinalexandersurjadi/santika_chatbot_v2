import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:santika_chatbot_v2/config/api.dart';
import 'package:santika_chatbot_v2/consts/assets.dart';
import 'package:santika_chatbot_v2/models/chat_log.dart';
import 'package:santika_chatbot_v2/consts/color.dart';
import 'dart:async';
import 'dart:convert';

import 'package:santika_chatbot_v2/utils/database.dart';
import 'package:santika_chatbot_v2/widgets/appbar.dart';
import 'package:santika_chatbot_v2/widgets/chip.dart';

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}

Future<List<ChatLog>> fetchChatLogFromDB() async{
  var dbHelper = DBHelper();
  List<ChatLog> chatLogs = await dbHelper.getMessage();
  return chatLogs;
}

class ChatScreenState extends State<ChatScreen>{
  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _message = <ChatMessage>[];

  Future<void> _getInitData() async{
    List<ChatLog> chatLog = await fetchChatLogFromDB();
    print("Print in State: " + chatLog.length.toString());
    int length = chatLog.length;
    print(chatLog);
    if(length > 0){
      for(int i=0; i<length; i++){
        ChatMessage message = new ChatMessage(text: chatLog[i].message, who: chatLog[i].who, time: chatLog[i].time,);
        setState(() {
          _message.insert(0, message);
        });
      }
    }
  }

  ScrollController _hideSuggestion;
  var _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideSuggestion = new ScrollController();
    _hideSuggestion.addListener((){
      if(_hideSuggestion.position.userScrollDirection == ScrollDirection.reverse){
        setState((){
          _isVisible = true;
          print("**** ${_isVisible} up");
        });
      }
      if(_hideSuggestion.position.userScrollDirection == ScrollDirection.forward){
        setState((){
          _isVisible = false;
          print("**** ${_isVisible} down");

        });
      }
    });
    _start();
  }

  _start() async {
    await _getInitData();
    ChatMessage initialMessage = ChatMessage(text: 'Hi, saya Bershca! Silakan tanyakan informasi yang ingin Anda ketahui.', who: 1, time: _makeTimestamp(),);
    Future.delayed(Duration(milliseconds: 750), () {
      setState(() {
        _message.insert(0, initialMessage);
      });
    });
  }

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new BershcaAppbar(title: "Bershca Chat Room", canBack: true, withInfo: true,),
      body: SafeArea(
        top: false,
        bottom: true,
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                reverse: true,
                itemBuilder: (_, int index) => _message[index],
                itemCount: _message.length,
              ),
            ),
            //new Divider(height: 1.0,),
            new Container(
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: BershcaColors.gradient1),
              ),
              padding: new EdgeInsets.symmetric(vertical: 12.0),
              child: SingleChildScrollView(
                //controller: _hideSuggestion,
                scrollDirection: Axis.horizontal,
                child: new Center(
                  child: new Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      new Chips(
                        onTap: (){
                          _textController.text = "Saya ingin bertanya tentang Santika Premiere Slipi";
                          setState(() {
                            _isComposing = true;
                          });
                        },
                        text: "Tentang Santika Premiere Slipi",
                      ),
                      new Chips(
                        onTap: () {
                          _textController.text = "Saya ingin bertanya tentang Kamar hotel";
                          setState(() {
                            _isComposing = true;
                          });
                        },
                        text: "Kamar Hotel",
                      ),
                      new Chips(
                        onTap: () {
                          _textController.text = "Saya ingin bertanya tentang Ruang rapat";
                          setState(() {
                            _isComposing = true;
                          });
                        },
                        text: "Ruang Rapat"
                      ),
                      new Chips(
                        onTap: (){
                          _textController.text = "Saya ingin melakukan Cek kamar";
                          setState(() {
                            _isComposing = true;
                          });
                        },
                        text: "Cek Kamar",
                      ),
                    ],
                  ),
                ),
              ),
          ),
            new Divider(height: 1.0,),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer(){
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            new Image.asset(
              BershcaAssets.messageIcon,
              width: 28.0,
            ),
            new SizedBox(
              width: 16.0,
            ),
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text){
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                  hintText: "Send a message...",
                  hintStyle: new TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFBCBEC0),
                  )
                ),
              ),
            ),
            new Container(
              //margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new InkWell(
                onTap: _isComposing ? () => _handleSubmitted(_textController.text) : null,
                child: Image.asset(
                  BershcaAssets.sendIcon,
                  width: 28.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _handleSubmitted(String text){
    _textController.clear();

    ChatMessage message = new ChatMessage(text: text, who: 0, time: _makeTimestamp());
    _saveToDB(0, text);

    ChatMessage messageResponse;

    String url = ApiConfig.baseUrl;

    String mResponse = "";
    String mResFooter = "";
    Future getAndParse(String param) async {
      List<dynamic> response = new List();
      url += param;
      print("Text        : " + text);
      print("Url         : " + url);
      print("Encoded Url : " + Uri.encodeFull(url));
      var res = await http.get(Uri.encodeFull(url), headers: {"Authentication": "Bearer${ApiConfig.authToken}"});

      print("Done waiting!");

      setState(() {
        var resBody = json.decode(res.body);
        print(resBody);

        print("Reformatting json result");


        int ul = resBody['ul'];
        print("ul = " + ul.toString());

        List<int> li, footer;
        List<String> message = new List<String>();
        List<dynamic> messageChild = new List<dynamic>();
        List<String> messageFooter = new List<String>();
        li = new List<int>();
        footer = new List<int>();

        print("getting ul value: " + ul.toString());

        for(int i=0; i<=ul; i++){
          li.add(resBody['li'][i][i.toString()]);
          footer.add(resBody['footer'][i][i.toString()]);
        }

        if(ul == 0){
          print(resBody["message"]);
          message.add(resBody["message"][ul][ul.toString()]);
          messageFooter.add(resBody["m_footer"][ul][ul.toString()]);
          print("Message: " + message[ul]);

          mResponse += message[ul];

          messageResponse = new ChatMessage(text: mResponse, who: 1, time: _makeTimestamp());
          _saveToDB(1, mResponse);
          _message.insert(0, messageResponse);

          if(messageFooter[ul] != ""){
            mResFooter += "\n" + messageFooter[ul];
          }
        }
        else if(ul == 1){
          print("ul = 1");
          print("li[0] = " + li[0].toString());
          for(int i=0; i<=li[ul]; i++){
            message.add(resBody["message"][ul][ul.toString()][i][i.toString()]);
            mResponse += (i>0 && i<=li[ul]? "  - " : "") + message[i] + (i != li[ul] ? "\n" : "");
          }

          messageFooter.add(resBody["m_footer"][ul][ul.toString()]);
          if(messageFooter[0] != ""){
            mResponse += "\n\n" + messageFooter[0];
          }

          messageResponse = new ChatMessage(text: mResponse, who: 1, time: _makeTimestamp());
          _saveToDB(1, mResponse);
          _message.insert(0, messageResponse);
        }
        else if(ul > 1){
          print(li[0]);
          int idx = 0;
          for(int i=0; i<=ul; i++){
            if(li[i] == 1) mResponse += resBody["message"][i][i.toString()] + "\n\n";
            else{
              //Main
              print(idx);
              messageChild.add(message);
              for(int j=0; j<=li[i]; j++){
                messageChild[idx].add(resBody["message"][i][i.toString()][j][j.toString()]);
                print("resBody[\"message\"][$i][\"$i\"][$j][\"$j\"]: " + resBody["message"][i][i.toString()][j][j.toString()]);
                mResponse += (j>0 && j<=li[i]? "  - " : "") + resBody["message"][i][i.toString()][j][j.toString()] + (i==ul && j==li[i]? "" : "\n") + (i!=ul && j==li[i]? "" : "");
              }

              //Footer
              messageFooter.add(resBody["m_footer"][i][i.toString()]);
              if(messageFooter[idx] != "") mResponse += (i!=ul? "" : "\n") + "\n" + messageFooter[idx] + (i!=ul? "\n\n" : "");
              else{
                mResponse += (i==ul ? "" : "\n");
              }
              idx++;
            }

          }

          messageResponse = new ChatMessage(text: mResponse, who: 1, time: _makeTimestamp());
          _saveToDB(1, mResponse);
          _message.insert(0, messageResponse);
        }

        //print(mResponse);
      });
    }

    setState(() {
      _message.insert(0, message);
      getAndParse(text);
    });
  }
}

const String _name = "User"; //harusnya nama kita disini
const String _botName = "Chatbot"; //nama bot nya

class ChatMessage extends StatelessWidget{

  ChatMessage({this.text, this.who, this.time});
  final String text;
  final int who;
  final String time;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: who == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          who == 0 ? new CircleAvatar(
            backgroundImage: AssetImage(BershcaAssets.defaultProfilePicture),
          ) : Container(),
          who == 0 ? new SizedBox(
            width: 8.0,
          ) : Container(),
          new Expanded(
            child: new Bubble(
              nip: who == 1 ? BubbleNip.rightBottom : BubbleNip.leftTop,
              color: who == 1 ? BershcaColors.greenHarmony : Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      color: who == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: who == 1 ? Colors.white : Color(0xFF6D6D6D),
                    ),
                  )
                ],
              ),
            ),
          ),
          who == 1 ? new SizedBox(
            width: 8.0,
          ) : Container(),
          who == 1 ? new CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(BershcaAssets.bershcaLogo),
          ) : Container()
        ],
      ),
    );
  }
}

void _saveToDB(int who, String message){
  var dbHelper = new DBHelper();

  dbHelper.saveChatLog(who, message, _makeTimestamp());

}

String _makeTimestamp(){
  DateTime date = DateTime.now();
  String day = date.day.toString();
  String month = date.month.toString();
  String year = date.year.toString();
  String hour = date.hour.toString();
  String minute = date.minute.toString();
  String second = date.second.toString();

  print("Timestamp to be inserted to db: " + year.toString() + "-" + month.toString() + "-" + day.toString()
      + " " + hour.toString() + ":" + minute.toString() + ":" + second.toString());

  String timestamp = year + "-" + month + "-" + day + " " +
      hour + ":" + minute + ":" + second;

  return timestamp;
}