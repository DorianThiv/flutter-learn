import 'dart:convert';
import '../users/user.class.dart';

enum EventConfidentiality { Public, Private }

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  int? id;
  String? name;
  String? code;
  String? description;
  int? type;
  DateTime? dateStart;
  DateTime? dateEnd;
  EventConfidentiality? confidentiality;
  String? secretCode;
  String? image;
  String? links;
  String? country;
  String? region;
  String? city;
  String? addressLine;
  String? postalCode;
  String? building;
  double latitude;
  double longitude;
  int userId;
  User user;

  Event({
    this.id,
    this.name,
    this.code,
    this.description,
    this.type,
    this.dateStart,
    this.dateEnd,
    this.confidentiality,
    this.secretCode,
    this.image,
    this.links,
    this.country,
    this.region,
    this.city,
    this.addressLine,
    this.postalCode,
    this.building,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.user,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        description: json['description'],
        type: json['type'],
        dateStart: DateTime.parse(json['dateStart']),
        dateEnd: DateTime.parse(json['dateEnd']),
        confidentiality: EventConfidentiality.values[json['confidentiality']],
        secretCode: json['secretCode'],
        image: json['image'],
        links: json['links'],
        country: json['country'],
        region: json['region'],
        city: json['city'],
        addressLine: json['addressLine'],
        postalCode: json['postalCode'],
        building: json['building'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        userId: json['userId'],
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'code': this.code,
        'description': this.description,
        'type': this.type,
        'dateStart': this.dateStart,
        'dateEnd': this.dateEnd,
        'confidentiality': this.confidentiality,
        'secretCode': this.secretCode,
        'image': this.image,
        'links': this.links,
        'country': this.country,
        'region': this.region,
        'city': this.city,
        'addressLine': this.addressLine,
        'postalCode': this.postalCode,
        'building': this.building,
        'latitude': this.latitude,
        'longitude': this.longitude,
        'userId': this.userId,
        'user': userToJson(this.user),
      };
}
