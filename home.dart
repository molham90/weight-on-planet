import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioGroup = 0;
  double _finalResult = 0.0;
  String _textFormat = "";

  void radioChange(int value){
    setState(() {
      radioGroup = value;

      switch(radioGroup) {
        case 0:
          _finalResult = calculateWieght(_myController.text, 0.06);
          _textFormat = "your wieght on mars is $_finalResult lbs";
          break;
        case 1:
          _finalResult = calculateWieght(_myController.text, 0.38);
          _textFormat = "your wieght on mars is $_finalResult lbs";
          break;
        case 2:
          _finalResult = calculateWieght(_myController.text, 0.91);
          _textFormat = "your wieght on mars is $_finalResult lbs";
          break;


      }
    });
  }

  final TextEditingController _myController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Wieght on planet x",
          style:
              new TextStyle(fontWeight: FontWeight.w400, color: Colors.white70),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            new Image.asset(
              'images/plantes.png',
              height: 130.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _myController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'please enter your wieght',
                        hintText: 'in pounhds',
                        icon: new Icon(Icons.person)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(value: 0, activeColor: Colors.red, groupValue: radioGroup, onChanged: radioChange),
                      new Text("Mars", style: new TextStyle(color: Colors.black), ),

                      new Radio<int>(value: 1,  activeColor: Colors.yellow, groupValue: radioGroup, onChanged: radioChange),
                      new Text("Mars", style: new TextStyle(color: Colors.black), ),

                      new Radio<int>(value: 2, activeColor: Colors.blue, groupValue: radioGroup, onChanged: radioChange),
                      new Text("Mars", style: new TextStyle(color: Colors.black), ),

                    ],
                  ),

                  //resut Text
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Text(_myController.text.isEmpty ? " pleasse enter your weight" : _textFormat,
                  style: new TextStyle(fontWeight: FontWeight.w400, color: Colors.blue, fontSize: 24.0),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWieght(String weight1, double multiplayer1) {
   if (int.parse(weight1).toString().isNotEmpty && int.parse(weight1) > 0){
     return int.parse(weight1) * multiplayer1;
   } else {
     print("wrong");
     return int.parse("180") * 0.38;
   }
  }
}
