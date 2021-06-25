import 'dart:developer';

import 'package:app_3/models/event.class.dart';
import 'package:app_3/services/events-service.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Event>? _events;

  @override
  void initState() {
    _events = EventsService().getEventsByPosition(45.188529, 5.724524, 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Network'),
      ),
      body: Container(
        child: FutureBuilder<Event>(
          future: _events,
          builder: (context, snapshot) {
            debugPrint('Hello 1');
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                debugPrint('Hello 2');
                return new Container(
                  height: 100,
                  color: Colors.red,
                );
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
