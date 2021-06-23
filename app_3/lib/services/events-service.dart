import 'package:app_3/services/network-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EventsService {
  var networkService = new NetworkService();
  // public async getPositionEvents(latitude: number, longitude: number, ray: number) {
  //   const request = new ThyRestPostRequest(`locations/position/events`, { latitude: latitude, longitude: longitude, ray: ray });
  //   const response: any[] = await this.restService.post(request);
  //   return response ? response.map(m => new EventDto(m)) : [];
  // }

  Future<Object> getEventsByPosition(
      double latitude, double longitude, int ray) async {
    Uri uri = Uri(
        host: networkService.host,
        port: networkService.uriport,
        path: networkService.path,
        query: 'locations/position/events');
    var response = await http
        .post(uri, body: {latitude: latitude, longitude: longitude, ray: ray});
    debugPrint(response.toString());
    return response;
  }
}
