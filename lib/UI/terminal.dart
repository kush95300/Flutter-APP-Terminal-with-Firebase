import 'package:Docker/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class terminal extends StatefulWidget {
  @override
  _createState createState() => _createState();
}

class _createState extends State<terminal> {
  @override
  var cmd, webdata;

  myweb() async {
    var url = "http://192.168.43.18/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);

    print(url);

    setState(() {
      webdata = r.body.toString();
    });

    print(webdata);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
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
            ])),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.cyan[900],
          ),
          margin: EdgeInsets.all(35),
          child: Card(
            color: Colors.cyan[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new FloatingActionButton(
                    heroTag: 1,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                    child: Icon(Icons.home),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // INPUT TERMINAL CONTAINER
                  Container(
                      margin: EdgeInsets.all(10),
                      // height: 200,
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        children: <Widget>[
                          Text(
                            " input Terminal",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          TextField(
                            onChanged: (value) {
                              cmd = value;
                              setState(() {
                                webdata = "Give Input";
                              });
                              if (cmd.contains('\t')) {
                                myweb();
                                print("ok");
                              }
                            },
                            onSubmitted: (value) {
                              (print('aa'));
                              webdata = null;
                              myweb();
                            },
                            //onFieldSubmitted: myweb
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  )),
                              labelText: " Enter Command here >>>>>>>>",
                            ),
                          ),
                          RaisedButton(
                            onPressed: () => myweb(),
                            color: Colors.white,
                            child: Text("Run"),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Terminal output ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      backgroundColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //OUTPUT TERMINAL CONTAINER
                  SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height - 400,
                        width: double.infinity,
                        color: Colors.black,
                        child: SingleChildScrollView(
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                webdata ?? " Please Wait .... ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
