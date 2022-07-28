part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoaded extends AppState {
  AppLoaded({
    required this.cursos,
    required this.misCursos,
    required this.inscripciones,
  });
  final List<Curso> cursos;
  final List<Curso> misCursos;

  final List<Inscripcion> inscripciones;
}

class AppLoading extends AppState {}

class AppError extends AppState {}
