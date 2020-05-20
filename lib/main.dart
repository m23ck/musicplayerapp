import 'dart:math';

import 'package:flutter/material.dart';
import 'package:musicplayerapp/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Music Player App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
            ),
            color: lightAccentColor,
            onPressed: () {},
          ),
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.menu,
              ),
              color: lightAccentColor,
              onPressed: () {},
            ),
          ],
        ),
        body: new Column(
          children: <Widget>[
            // seekbar
            new Expanded(
              child: new Center(
                child: new Container(
                  width: 125.0,
                  height: 125.0,
                  child: new ClipOval(
                    clipper: new CircleClipper(),
                    child: Image.asset(
                      "images/blackbearcover.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // visualizer
            new Container(
              width: double.infinity,
              height: 125.0,
            ),

            // songtitle artistname and controls
            new Container(
              width: double.infinity,
              child: new Material(
                  shadowColor: const Color(0x44000000),
                  color: accentColor,
                  child: new Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                      child: new Column(
                        children: <Widget>[
                          new RichText(
                            text: new TextSpan(text: '', children: [
                              new TextSpan(
                                text: 'Song Title\n',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4.0,
                                  height: 1.5,
                                ),
                              ),
                              new TextSpan(
                                text: 'Artist Name',
                                style: new TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 12.0,
                                  letterSpacing: 3.0,
                                  height: 1.5,
                                ),
                              ),
                            ]),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Container(),
                                ),

                                // prevbutton
                                new IconButton(
                                    splashColor: lightAccentColor,
                                    highlightColor: Colors.transparent,
                                    icon: new Icon(
                                      Icons.skip_previous,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                    onPressed: () {
                                      // TODO:
                                    }),

                                new Expanded(
                                  child: new Container(),
                                ),

                                new RawMaterialButton(
                                  shape: CircleBorder(),
                                  fillColor: Colors.white,
                                  splashColor: lightAccentColor,
                                  highlightColor:
                                      lightAccentColor.withOpacity(0.5),
                                  elevation: 10.0,
                                  highlightElevation: 5.0,
                                  onPressed: () {
                                    // TODO:
                                  },
                                  child: new Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: new Icon(
                                      Icons.play_arrow,
                                      color: darkAccentColor,
                                      size: 35.0,
                                    ),
                                  ),
                                ),

                                new Expanded(
                                  child: new Container(),
                                ),

                                new IconButton(
                                    splashColor: lightAccentColor,
                                    highlightColor: Colors.transparent,
                                    icon: new Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                    onPressed: () {
                                      // TODO:
                                    }),

                                new Expanded(
                                  child: new Container(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
            )
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
      center: new Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
