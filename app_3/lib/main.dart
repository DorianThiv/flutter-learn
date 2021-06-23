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
  Future<Object> _events;

  @override
  void initState() {
    _events = EventsService().getEventsByPosition(45.188529, 5.724524, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App Network'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _events,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return new Container(height: 100, color: Colors.red);
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
