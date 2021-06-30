import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:app_5/events/event.class.dart';
import 'package:app_5/shared/network-service.dart';

Future<List<Event>> getEventsByPosition(double latitude, double longitude, int ray) async {
  try {
    Uri uri = Uri.http('${NetworkService.host}', '${NetworkService.path}locations/position/events');
    debugPrint(uri.toString());
    final response = await http.post(
      uri,
      headers: NetworkService.headers,
      body: jsonEncode({
        'latitude': latitude,
        'longitude': longitude,
        'ray': ray
      }),
    );
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      List<dynamic> events = json.decode(response.body);
      return events.map((e) => Event.fromJson(e)).toList();
    }
  } catch (error) {
    debugPrint(error.toString());
  }
  return Future.value([]);
}
