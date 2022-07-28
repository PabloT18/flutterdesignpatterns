import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/views/curso_card.dart';
import 'package:flutter/material.dart';

class ListCursos extends StatelessWidget {
  const ListCursos({Key? key, required this.cursos, this.main = true})
      : super(key: key);

  final List<Curso> cursos;
  final bool main;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cursos.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CursoCard(cursos: cursos, index: index, main: main),
      ),
    );
  }
}
