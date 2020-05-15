import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_psico/classes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

Stopwatch stopwatch = new Stopwatch();
ItemModel sostituto;
ItemModel sostituto1;
ItemModel sostituto2;
bool uno = false;
bool due = false;
bool tre = false;
bool corretto1 = false;
bool corretto2 = false;
bool corretto3 = false;
String messaggio1 = "";
String messaggio2 = "";
String messaggio3 = "";

List<ItemModel> cubi = [
  ItemModel(
      icon: AssetImage(
        "assets/piccolo.png",
      ),
      name: "1",
      value: "grigio"),
  ItemModel(icon: AssetImage("assets/grande.png"), name: "2", value: "rosa"),
  ItemModel(icon: AssetImage("assets/medio.png"), name: "3", value: "nero"),
];

List<ItemModel> trapezio = [
  ItemModel(icon: AssetImage("assets/nero.png"), name: "1", value: "grigio"),
  ItemModel(icon: AssetImage("assets/rosa.png"), name: "3", value: "nero"),
  ItemModel(icon: AssetImage("assets/grigio.png"), name: "2", value: "rosa"),
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// pop up con la lista dei paesi
  _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                // ----------
                return Container(
                  width: 250.0,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Benvenuto",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            Text(
                              'Testa le tue capacità.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Riporta ogni quadrato nella sezione corrispondente alla sua grandezza.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ])),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Text(
                            "Prosegui",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }));
        });
  }

  // pop up con la lista dei paesi
  _showResults() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                // ----------
                return Container(
                  width: 250.0,
                  height: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Risultato",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                            Text(
                              'Tempo: ' +
                                  stopwatch.elapsed.inSeconds.toString() +
                                  " secondi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              corretto1 & corretto2 & corretto3
                                  ? "Hai fatto giusto"
                                  : "Hai sbagliato",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              messaggio1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              messaggio2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              messaggio3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ])),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }));
        });
  }

  @override
  void initState() {
    super.initState();
    stopwatch.start();
    Timer.run(() => _showDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.pink,
            title: Text('Il test di Malevic '),
          ),
          preferredSize: Size.fromHeight(50.0)),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: cubi.map((item) {
                  return Container(
                      padding: EdgeInsets.only(bottom: 100),
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.all(8.0),
                      child: Draggable<ItemModel>(
                          data: item,
                          childWhenDragging: Image(
                            image: item.icon,
                          ),
                          feedback: Image(
                            image: item.icon,
                            fit: BoxFit.scaleDown,
                          ),
                          child: Image(
                            image: item.icon,
                            fit: BoxFit.scaleDown,
                          )));
                }).toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DragTarget<ItemModel>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                        child: trapezio[0].accepting
                            ? Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Positioned(
                                    child: Image(image: trapezio[0].icon),
                                  ),
                                  Positioned(
                                    child: Image(image: sostituto.icon),
                                    bottom: 10,
                                    right: 0.5,
                                  ),
                                ],
                              )
                            : Image(image: trapezio[0].icon));
                  },
                  onAccept: (oggetto) {
                    trapezio[0].accepting = true;
                    sostituto = oggetto;
                    setState(() {
                      cubi.remove(oggetto);
                    });
                    uno = true;
                    if (trapezio[0].name != oggetto.name) {
                      messaggio1 = "Cubo " +
                          oggetto.name.toString() +
                          ": " +
                          "Sezione " +
                          trapezio[0].name.toString();
                    }
                    if (oggetto.value == trapezio[0].value) {
                      corretto1 = true;
                    }
                    if (uno & due & tre) {
                      stopwatch.stop();
                      _showResults();
                    }
                  },
                ),
                DragTarget<ItemModel>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                        child: trapezio[1].accepting
                            ? Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Positioned(
                                    child: Image(image: trapezio[1].icon),
                                  ),
                                  Positioned(
                                    child: Image(image: sostituto1.icon),
                                    bottom: 10,
                                    right: 0.5,
                                  ),
                                ],
                              )
                            : Image(image: trapezio[1].icon));
                  },
                  onAccept: (oggetto) {
                    trapezio[1].accepting = true;
                    sostituto1 = oggetto;
                    setState(() {
                      cubi.remove(oggetto);
                    });
                    due = true;
                    if (trapezio[1].name != oggetto.name) {
                      messaggio2 = "Cubo " +
                          oggetto.name.toString() +
                          ":" +
                          "Sezione " +
                          trapezio[1].name.toString();
                    }
                    if (oggetto.value == trapezio[1].value) {
                      corretto2 = true;
                    }
                    if (uno & due & tre) {
                      stopwatch.stop();
                      _showResults();
                    }
                  },
                ),
                DragTarget<ItemModel>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                        child: trapezio[2].accepting
                            ? Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Positioned(
                                    child: Image(image: trapezio[2].icon),
                                  ),
                                  Positioned(
                                    child: Image(image: sostituto2.icon),
                                    bottom: 10,
                                    right: 0.5,
                                  ),
                                ],
                              )
                            : Image(image: trapezio[2].icon));
                  },
                  onAccept: (oggetto) {
                    trapezio[2].accepting = true;
                    sostituto2 = oggetto;
                    setState(() {
                      cubi.remove(oggetto);
                    });
                    tre = true;
                    if (trapezio[2].name != oggetto.name) {
                      messaggio3 = "Cubo " +
                          oggetto.name.toString() +
                          ":" +
                          "Sezione " +
                          trapezio[2].name.toString();
                    }
                    if (oggetto.value == trapezio[2].value) {
                      corretto3 = true;
                    }
                    if (uno & due & tre) {
                      stopwatch.stop();
                      _showResults();
                    }
                  },
                ),
              ],
            ),
          ]),
    );
  }
}
