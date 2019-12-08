import 'package:flutter/material.dart';
import 'package:location/location.dart';

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
                  ? CircularProgressIndicator()
                  : Text("Location:" +
                      currentLocation["latitude"].toString() +
                      " " +
                      currentLocation["longitude"].toString(),style: TextStyle(fontSize: 28),),
            ],
          ),
        ),
      ),
    );
  }
}
