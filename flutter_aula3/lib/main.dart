import 'package:flutter_aula1/game.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Bem-vindxs', style: TextStyle(
           color: Colors.black54
         )),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             new Text(
              'Que tal jogarmos um Jogo da Velha?\n\n',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
               ),
             ),
             playButton()
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 200, left: 20),
            child: imageLogo(),
      ),
      
    );
  }


  Widget playButton() {
      return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(
            builder: (context) => Game(),
          ));
        },
        color: Colors.pink[100],
        child: Text(
          'Jogar',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget imageLogo(){
    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/logo.png'),
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(Colors.pink[100].withOpacity(0.2), BlendMode.dstATop),
        ),
        shape: BoxShape.circle,
      ),
    );
  }

}
