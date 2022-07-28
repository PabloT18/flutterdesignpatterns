// To parse this JSON data, do
//
//     final docente = docenteFromJson(jsonString);

// To parse this JSON data, do
//
//     final docenteResponse = docenteResponseFromJson(jsonString);

import 'dart:convert';

DocenteResponse docenteResponseFromJson(String str) =>
    DocenteResponse.fromJson(json.decode(str));

String docenteResponseToJson(DocenteResponse data) =>
    json.encode(data.toJson());

class DocenteResponse {
  DocenteResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Docente> results;

  factory DocenteResponse.fromJson(Map<String, dynamic> json) =>
      DocenteResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Docente>.from(json["results"].map((x) => Docente.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Docente {
  Docente({
    required this.id,
    required this.name,
    required this.lastName,
    required this.idNumber,
    required this.email,
    required this.academicTitle,
    required this.telephone,
  });

  int id;
  String name;
  String lastName;
  String idNumber;
  String email;
  String academicTitle;
  String telephone;

  factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        idNumber: json["idNumber"],
        email: json["email"],
        academicTitle: json["academicTitle"],
        telephone: json["telephone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "idNumber": idNumber,
        "email": email,
        "academicTitle": academicTitle,
        "telephone": telephone,
      };
}
