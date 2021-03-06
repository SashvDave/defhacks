import 'dart:async';
import 'package:defhacks/Screens/login.dart';
import 'package:defhacks/Screens/upload.dart';
import 'package:defhacks/Screens/yesBraces.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:defhacks/Screens/clinics.dart';
import 'package:defhacks/Screens/upload.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Clinics());
}

class Clinics extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: clinics(title: 'Flutter Demo Home Page'),
    );
  }
}

class clinics extends StatefulWidget {
  clinics({Key key, this.title}) : super(key: key);

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

class _MyHomePageState extends State<clinics> {
  @override
  void initState() {
    super.initState();
  }

  noSuchMethod(Invocation i) => super.noSuchMethod(i);

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Main',
      style: optionStyle,
    ),
    Text(
      'Index 1: Clinics',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _selectedIndex = 0;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => uploadScreen()));
      } else {
        _selectedIndex = 1;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => yesBracesScreen()));
      }
    });
  }

  void _launchURL(String uri) async {
    String url = ("https://www.google.com/maps/search/" + uri) + "/";
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Clinics'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginScreen())));
                  },
                  child: Icon(Icons.portrait_rounded)))
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps), 
            label: "Upload Image"),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: "Clinics",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(65, 65, 65, 65),
            child: new Column(
              children: [
                Container(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Check out these clinics for getting professional help!',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[100],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                        child: ListTile(
                          title: new Center(
                            child: Text(
                              "Milpitas Dental Center",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              _launchURL("995+County+Hwy+G4+STE+215");
                            },
                            child: new Icon(Icons.room),
                          ),
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              launch("tel://(408)263-6464");
                            },
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ])),
                Card(
                    margin: new EdgeInsets.symmetric(vertical: 20),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[100],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: ListTile(
                          title: new Center(
                            child: Text(
                              "Milpitas Town Center Dental Care",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              _launchURL("491+E+Calaveras+Blvd");
                            },
                            child: new Icon(Icons.room),
                          ),
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              launch("tel://(408)262-6608");
                            },
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ])),
                Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[100],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: ListTile(
                          title: new Center(
                            child: Text(
                              "Brilliance Dental Care",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              _launchURL("52+Skytop+St+suite+40");
                            },
                            child: new Icon(Icons.room),
                          ),
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              launch("tel://(408)755-9800");
                            },
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ])),
                Card(
                    margin: new EdgeInsets.symmetric(vertical: 20),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[100],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: ListTile(
                          title: new Center(
                            child: Text(
                              "City Square Dental Care",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              _launchURL("1780+N+Milpitas+Blvd");
                            },
                            child: new Icon(Icons.room),
                          ),
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              launch("tel://(408)946-9234");
                            },
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ])),
                Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[100],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: ListTile(
                          title: new Center(
                            child: Text(
                              "E Dental Care",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              _launchURL("1156+Jacklin+Rd");
                            },
                            child: new Icon(Icons.room),
                          ),
                          FlatButton(
                            color: new Color(0x000000),
                            onPressed: () {
                              launch("tel://(408)719-8295");
                            },
                            child: const Icon(Icons.phone),
                          ),
                        ],
                      ),
                    ])),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
