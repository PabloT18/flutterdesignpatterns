import 'dart:async';

import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/services/servico_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/mis_cursos_response.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<OnGetData>(_getData);
  }

  final ServicoImpl servicio = ServicoImpl();

  FutureOr<void> _getData(OnGetData event, Emitter<AppState> emit) async {
    //Todo: consumir REST

    final cursos = await servicio.getCursos();
    final inscripciones = await servicio.getMisCursos();

    List<Curso> misCursos = [];
    for (var inscripcion in inscripciones!) {
      final curso =
          cursos!.firstWhere((element) => element.id == inscripcion.course);
      misCursos.add(curso);
    }
    await Future.delayed(const Duration(seconds: 1));
    emit(AppLoaded(
        cursos: cursos!, inscripciones: inscripciones, misCursos: misCursos));
  }
}
