import 'dart:convert';

Locations locationsFromJson(String str) => Locations.fromJson(json.decode(str));

String locationsToJson(Locations data) => json.encode(data.toJson());

//It's a location model I defined for my data
//I think all it's clear
//define values and methode for parsing and convert them to json
//use these methode in "service.dart" file to fill all data in a list I view in main page

class Locations {
  Locations({
    this.locations,
  });

  List<Location>? locations;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
      };
}

class Location {
  Location({
    this.name,
    this.disassembledName,
    this.type,
    this.matchQuality,
    this.isBest,
  });

  String? name;
  String? disassembledName;
  String? type;
  int? matchQuality;
  bool? isBest;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        disassembledName: json["disassembledName"],
        type: json["type"],
        matchQuality: json["matchQuality"],
        isBest: json["isBest"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "disassembledName": disassembledName,
        "type": type,
        "matchQuality": matchQuality,
        "isBest": isBest,
      };
}
