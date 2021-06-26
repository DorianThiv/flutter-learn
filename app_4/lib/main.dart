import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test map'),
        ),
        body: buildFlutterMap());
  }

  FlutterMap buildFlutterMap() {
    final initialPos = LatLng(45.188529, 5.724524);
    return FlutterMap(
      options: MapOptions(
        center: initialPos,
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: [
          'a',
          'b',
          'c'
        ]),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: initialPos,
              builder: (ctx) {
                return Container(
                  child: FlutterLogo(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
