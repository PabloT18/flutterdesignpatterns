import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/models/docente.dart';
import 'package:app_patrones/models/mis_cursos_response.dart';
import 'package:app_patrones/services/sistema.dart';
import 'package:dio/dio.dart';

class ServicoImpl implements Sericios {
  @override
  Future<List<Curso>?> getCursos() async {
    final dio = Dio();

    const url = 'http://127.0.0.1:8000/cursos/';

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode != 200) {
        return null;
      }
      final Map<String, dynamic> decodedData = response.data;

      final cursos = Cursos.fromJson(decodedData['results']).cursos;
      return cursos;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Docente?> getDocente() async {
    final dio = Dio();

    const url = 'http://127.0.0.1:8000/teacher/';

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode != 200) {
        return null;
      }
      final Map<String, dynamic> decodedData = response.data;

      Docente docente = DocenteResponse.fromJson(decodedData).results[0];
      return docente;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Inscripcion>?> getMisCursos() async {
    final dio = Dio();

    const url = 'http://127.0.0.1:8000/inscripciones/';

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode != 200) {
        return null;
      }
      final Map<String, dynamic> decodedData = response.data;

      final cursos = MisCursosResponse.fromJson(decodedData).results;
      return cursos;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setInscripcion(String cedula, int cursoId) async {
    final dio = Dio();
    const url = 'http://127.0.0.1:8000/inscripciones/';
    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap(
            {"student": cedula, "course": cursoId, "date": "2022-07-28"}),
      );

      return response;
    } catch (e) {
      print("Error");
    }
  }
}
