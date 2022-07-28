class Cursos {
  Cursos.fromJson(List<dynamic> jsonList) {
    for (var cursoMdl in jsonList) {
      final cursoModel = Curso.fromJson(cursoMdl);
      cursos.add(cursoModel);
    }
  }

  List<Curso> cursos = [];
}

class Curso {
  Curso({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.price,
    this.maxCapacity,
    this.image,
    this.actualCapacity,
    this.status,
  });

  int? id;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  int? price;
  int? maxCapacity;
  String? image;
  int? actualCapacity;
  int? status;

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        id: json["id"],
        name: json["name"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        price: json["price"],
        maxCapacity: json["max_capacity"],
        image: json["image"],
        actualCapacity: json["actual_capacity"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "price": price,
        "max_capacity": maxCapacity,
        "image": image,
        "actual_capacity": actualCapacity,
        "status": status,
      };
}
