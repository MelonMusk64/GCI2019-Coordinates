import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Location location = Location();

  Map<String, double> currentLocation;

  @override
  void initState() {
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coordinates',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coordinates'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              currentLocation == null
                  ? Text("")
                  : Text(
                      "Location:" +
                          userLocation["latitude"].toString() +
                          " " +
                          userLocation["longitude"].toString(),
                      style: TextStyle(fontSize: 28),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _getLocation().then((value) {
                      setState(() {
                        currentLocation = value;
                      });
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    "Get Location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
