import 'package:flutter/material.dart';

import 'dart:convert';

Regions regionsFromJson(String str) => Regions.fromJson(json.decode(str));
String regionsToJson(Regions data) => json.encode(data.toJson());
//
//
Hostels hostelsFromJson(String str) => Hostels.fromJson(json.decode(str));
String hostelsToJson(Hostels data) => json.encode(data.toJson());
//
//
// SchoolHostels schoolhostelsFromJson(String str) =>
//     SchoolHostels.fromJson(json.decode(str));
// String schoolhostelsToJson(SchoolHostels data) => json.encode(data.toJson());

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
// String userModelToJson(SchoolHostels data) => json.encode(data.toJson());

class Regions {
  Regions({
    required this.id,
    required this.name,
  });
  String name;
  String id;
  factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class Hostels {
  Hostels({
    required this.name,
    required this.amt_per_year,
    required this.description,
    required this.available_rooms,
    required this.distance_car,
    required this.gender,
    required this.distance_walk,
    required this.hostel_images,
    required this.rate,
    required this.amenities,
    required this.ispopular,
    required this.region,
    required this.city,
    required this.university,
  });

  String name;
  int? amt_per_year;
  String? description;
  int? available_rooms;
  int? distance_car;
  String? gender;
  int? distance_walk;
  List<String?>? hostel_images;
  int? rate;
  List<String?>? amenities;
  bool? ispopular;
  String? region;
  String? city;
  String? university;
  

  factory Hostels.fromJson(Map<String, dynamic> json) => Hostels(
        name: json["name"],
        amt_per_year: json["amt_per_year"],
        description: json["description"],
        available_rooms: json["available_rooms"],
        distance_car: json["distance_car"],
        gender: json["gender"],
        distance_walk: json["distance_walk"],
        hostel_images: json["hostel_images"] != null
            ? List<String?>.from(json["hostel_images"])
            : null,
        rate: json["rate"],
        amenities: json["amenities"] != null
            ? List<String?>.from(json["amenities"])
            : null,
        ispopular: json["ispopular"],
        region: json["region"],
        city: json["city"],
        university: json["university"],
        
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amt_per_year": amt_per_year,
        "description": description,
        "available_rooms": available_rooms,
        "distance_car": distance_car,
        "gender": gender,
        "distance_walk": distance_walk,
        "hostel_images": hostel_images != null
            ? List<dynamic>.from(hostel_images!.map((x) => x))
            : null,
        "rate": rate,
        // "amenities": amenities,
        "amenities": amenities != null
            ? List<dynamic>.from(amenities!.map((x) => x))
            : null,
        "ispopular": ispopular,
        "region": region,
        "city": city,
        "university": university,
      };
}

// class SchoolHostels {
//   SchoolHostels({
//     required this.name,
//     required this.region,
//     required this.university,
//   });

//   String name;
//   String region;
//   String university;

//   factory SchoolHostels.fromJson(Map<String, dynamic> json) => SchoolHostels(
//         name: json["name"],
//         region: json["region"],
//         university: json["university"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "region": region,
//         "university": university,
//       };
// }

class UserModel {
  UserModel({
    required this.name,
    required this.id,
    required this.email,
  });

  String? name;
  String? id;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
      };
}
