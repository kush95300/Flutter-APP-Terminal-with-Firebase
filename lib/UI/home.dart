import 'package:Docker/UI/terminal.dart';
import 'package:Docker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'SplashScreen.dart';

class Dock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: "Splash",
      routes: <String, WidgetBuilder>{
        "Splash": (BuildContext context) => SplashScreen(),
        "/terminal": (BuildContext context) => terminal(),
        "/docker": (BuildContext context) => docker(),
      },
    );
  }
}

class my_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new GradientAppBar(
        title: new Text(
          "Docker UI",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              foreground: Paint()..color = Colors.yellow),
        ),
        gradient:
            new LinearGradient(colors: [Colors.blue, Colors.green, Colors.red]),
        centerTitle: false,
        leading: new Image.asset("assets/docker_logo.png"),
        // backgroundColor: Colors.brown[900],
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              /*   stops: [
                0.2,
                0.8,
                0.3,
                0.2,
                0.5
              ],*/
              colors: [
                Colors.blueAccent,

                Colors.green,
                Colors.red,
                // Colors.brown,
                //Colors.black,
                //Colors.deepPurple
              ]),
        ),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        color: Colors.brown[900],
                        //disabledColor: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.create,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "Create",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        //color: Colors.lightBlue,
                        color: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.delete,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "Delete",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            new SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        //color: Colors.lightBlue,
                        color: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.view_list,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "List",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        color: Colors.brown[900],
                        disabledColor: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.stay_current_landscape,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text("Terminal",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
            new SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        //color: Colors.lightBlue,
                        color: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.create,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "Dockerfile",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/terminal");
                        },
                        //color: Colors.lightBlue,
                        color: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.more_vert,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "Other",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            new SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 100,
                      child: new RaisedButton(
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                        //color: Colors.lightBlue,
                        color: Colors.brown[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: new Icon(
                          Icons.exit_to_app,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Text(
                      "Exit",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
