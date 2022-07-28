import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/models/docente.dart';

import '../models/mis_cursos_response.dart';

abstract class Sericios {
  Future<List<Curso>?> getCursos();
  Future<Docente?> getDocente();

  Future<List<Inscripcion>?> getMisCursos();
}
