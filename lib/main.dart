import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:supply/api/maps.dart';


String s;

void main() => runApp(GMaps());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  var list;
  Future<Null> refreshApp() async {
    GlobalKey<RefreshIndicatorState>().currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 0));

    setState(() {
      list = List.generate(Random().nextInt(10), (i) => "Item $i");
    });

    return null;
  }

  String country = 'USA';
  String state = 'Texas';
  String city = 'Katy';

  void req(String country, String state, String city) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=USA';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {"x-rapidapi-key": "57035e1ba6msh3e5e502bcaba459p1cb3a0jsnd44ba910504b"});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (int i = 1; i < jsonResponse['data']['covid19Stats'].length; i++) {
        if (jsonResponse['data']['covid19Stats'][i]['province'] == state) {
          if(jsonResponse['data']['covid19Stats'][i]['city'] == city) {
            s = jsonResponse['data']['covid19Stats'][i]['confirmed']
                .toString();
            print(jsonResponse['data']['covid19Stats'][i]['confirmed']
                .toString());
          }
          else{
          }
        }
        else{
        }
      }
    }
    else{
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {

    String temp = '0';

    req(country, state, city);
    if(s!=null) {
      temp = s;
    }
    else{
      sleep(Duration(seconds: 1));
      refreshApp();
    }
    return Scaffold(

    );
  }
}

