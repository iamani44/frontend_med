// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.name,
    this.composition,
    this.usage,
  });

  String name;
  String composition;
  String usage;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["Name"],
    composition: json["Composition"],
    usage: json["Usage"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Composition": composition,
    "Usage": usage,
  };
}
