// To parse this JSON data, do
//
//     final docente = docenteFromJson(jsonString);

import 'dart:convert';

Docente docenteFromJson(String str) => Docente.fromJson(json.decode(str));

String docenteToJson(Docente data) => json.encode(data.toJson());

class Docente {
  Docente({
    this.cedula,
    this.correo,
    this.nombre,
    this.apellido,
    this.titulo,
  });

  String? cedula;
  String? correo;
  String? nombre;
  String? apellido;
  String? titulo;

  factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        cedula: json["cedula"],
        correo: json["correo"],
        nombre: json["Nombre"],
        apellido: json["Apellido"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "correo": correo,
        "Nombre": nombre,
        "Apellido": apellido,
        "titulo": titulo,
      };
}
