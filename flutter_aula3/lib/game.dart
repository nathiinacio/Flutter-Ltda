import 'package:flutter/material.dart';


class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  Color color1 = Colors.black26;
  Color color2 = Colors.black26;
  Color color3 = Colors.black26;
  Color color4 = Colors.black26;
  Color color5 = Colors.black26;
  Color color6 = Colors.black26;
  Color color7 = Colors.black26;
  Color color8 = Colors.black26;
  Color color9 = Colors.black26;

  String text1 = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  String text6 = '';
  String text7 = '';
  String text8 = '';
  String text9 = '';

  String defaultText = '';
  Color  defaultColor = Colors.purple[100];

  void changeButton(identifier) {
    setState(() {
      switch (identifier) {
        case 1:
          color1 = defaultColor;
          text1 = changeText();
          break;
        case 2:
           color2 = defaultColor;
           text2 = changeText();
           break;
        case 3:
          color3 =defaultColor;
          text3 = changeText();
          break;
        case 4:
           color4 = defaultColor;
           text4 = changeText();
           break;
        case 5:
          color5 = defaultColor;
          text5 = changeText();
          break;
        case 6:
           color6 = defaultColor;
           text6 = changeText();
           break;
        case 7:
          color7 = defaultColor;
          text7 = changeText();
          break;
        case 8:
           color8 = defaultColor;
           text8 = changeText();
           break;
        case 9:
           color9 = defaultColor;
           text9 = changeText();
           break;
      }
    });
  }

 void restartAll() {
    setState(() {
        color1 = Colors.black26;
        color2 = Colors.black26;
        color3 = Colors.black26;
        color4 = Colors.black26;
        color5 = Colors.black26;
        color6 = Colors.black26;
        color7 = Colors.black26;
        color8 = Colors.black26;
        color9 = Colors.black26;
        text1 = '';
        text2 = '';
        text3 = '';
        text4 = '';
        text5 = '';
        text6 = '';
        text7 = '';
        text8 = '';
        text9 = '';
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Jogo da Velha', style: TextStyle(
           color: Colors.black54
         )),
        backgroundColor: Colors.pink[100],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            child: buildButton(text1, color1, 1),
          ),
          Container(
            child: buildButton(text2, color2, 2),
          ),
          Container(
            child: buildButton(text3, color3, 3),
          ),
          Container(
            child: buildButton(text4, color4, 4),
          ),
          Container(
            child: buildButton(text5, color5, 5),
          ),
          Container(
            child: buildButton(text6, color6, 6),
          ),
          Container(
            child: buildButton(text7, color7, 7),
          ),
          Container(
            child: buildButton(text8, color8, 8),
          ),
          Container(
            child: buildButton(text9, color9, 9),
          ),
        ],
      ),
      floatingActionButton: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 300, left: 20),
            child: restartButton(),
      ),
    );
  }


 String changeText() {
   if (defaultText == ''){
     defaultText = 'X';
     defaultColor = Colors.lightBlue[100];
   } else if (defaultText == 'X'){
     defaultText = 'O';
     defaultColor = Colors.purple[100];
   } else {
     defaultText = 'X';
     defaultColor = Colors.lightBlue[100];
   }
   return defaultText;
 }

  Widget buildButton(text, color, identifier) {
    return Container(
      width: 300,
      height: 50,
      child: RaisedButton(
        onPressed: () {
         changeButton(identifier);
        },
        color: color,
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }


  Widget restartButton() {
      return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
         restartAll();
        },
        color: Colors.pink[100],
        child: Text(
          'Recomeçar',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }


}