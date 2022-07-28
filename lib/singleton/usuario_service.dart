class Estudiante {
  static Estudiante? _instance;

  Estudiante._(
    String apellido,
    String cedula,
    String correo,
    String nombre,
  ) {
    apellidoo = apellido;
    cedulaa = cedula;
    correoo = correo;
    nombree = nombre;
  }

  factory Estudiante({
    required String apellido,
    required String cedula,
    required String correo,
    required String nombre,
  }) {
    _instance ??= Estudiante._(
      apellido,
      cedula,
      correo,
      nombre,
    );
    return _instance!;
  }

  late String apellidoo;
  late String nombree;
  late String correoo;
  late String cedulaa;

  static get estudiante => _instance;
}
