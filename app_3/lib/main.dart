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
  late Future<List<Event>> _events;
  final _biggerFont = const TextStyle(fontSize: 18.0);

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
        child: FutureBuilder<List<Event>>(
          future: _events,
          builder: (context, snapshot) {
            debugPrint('Hello 1');
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Event event = snapshot.data?[index] as Event;
                    return _buildRow(event);
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildRow(Event event) {
    var name = event.name != null ? event.name.toString() : '';
    return ListTile(
      title: Text(
        name,
        style: _biggerFont,
      ),
    );
  }
}
