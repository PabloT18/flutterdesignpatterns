part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class OnGetData extends AppEvent {}

class SetCurso extends AppEvent {
  SetCurso({required this.curso});
  final Curso curso;
}
