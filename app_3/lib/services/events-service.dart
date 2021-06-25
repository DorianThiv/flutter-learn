import 'dart:convert';

import 'package:app_3/models/event.class.dart';
import 'package:app_3/services/network-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EventsService {
  /// {@tool snippet}
  /// Hello
  /// {@end-tool}
  Future<List<Event>> getEventsByPosition(double latitude, double longitude, int ray) async {
    try {
      debugPrint('getEventsByPosition() start');
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
      debugPrint(response.body.toString());
      if (response.statusCode == 200) {
        List<dynamic> events = json.decode(response.body);
        debugPrint('getEventsByPosition() end');
        return events.map((e) => Event.fromJson(e)).toList();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return Future.value([]);
  }
}
