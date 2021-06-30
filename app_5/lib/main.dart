import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/retry.dart';
import 'package:latlong2/latlong.dart';
import 'package:app_5/events/event.class.dart';
import 'package:app_5/events/events-service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App 3',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Home page

  late Future<List<Event>> _events;
  final List<Marker> _markers = [];

  @override
  void initState() {
    loadEvents(45.188529, 5.724524, 100);
    super.initState();
  }

  void loadEvents(lat, lng, ray) {
    setState(() {
      _events = getEventsByPosition(lat, lng, ray);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _events,
        builder: (context, AsyncSnapshot<List<Event>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final events = snapshot.data;
          for (var event in events!) {
            _markers.add(
              Marker(
                width: 30.0,
                height: 30.0,
                point: LatLng(event.latitude, event.longitude),
                anchorPos: AnchorPos.align(AnchorAlign.top),
                builder: (ctx) {
                  return Container(
                    child: Image(
                      image: AssetImage('assets/marker.png'),
                    ),
                  );
                },
              ),
            );
          }
          return buildFlutterMap();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          loadEvents(45.188529, 5.724524, 100);
        },
      ),
    );
  }

  FlutterMap buildFlutterMap() {
    final initialPos = LatLng(45.188529, 5.724524);
    debugPrint(initialPos.toString());
    return FlutterMap(
      options: MapOptions(
        center: initialPos,
        zoom: 10.0,
      ),
      layers: [
        TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: [
          'a',
          'b',
          'c'
        ]),
        MarkerLayerOptions(markers: _markers),
      ],
    );
  }
}
