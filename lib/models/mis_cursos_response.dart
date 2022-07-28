// To parse this JSON data, do
//
//     final misCursosResponse = misCursosResponseFromJson(jsonString);

import 'dart:convert';

MisCursosResponse misCursosResponseFromJson(String str) =>
    MisCursosResponse.fromJson(json.decode(str));

String misCursosResponseToJson(MisCursosResponse data) =>
    json.encode(data.toJson());

class MisCursosResponse {
  MisCursosResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Inscripcion>? results;

  factory MisCursosResponse.fromJson(Map<String, dynamic> json) =>
      MisCursosResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Inscripcion>.from(
            json["results"].map((x) => Inscripcion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Inscripcion {
  Inscripcion({
    required this.student,
    required this.course,
    required this.date,
  });

  String student;
  int course;
  DateTime date;

  factory Inscripcion.fromJson(Map<String, dynamic> json) => Inscripcion(
        student: json["student"],
        course: json["course"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "student": student,
        "course": course,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
