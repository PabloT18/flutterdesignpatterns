import 'package:app_patrones/models/curso_model.dart';
import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  const CursoCard({
    Key? key,
    required this.index,
    required this.cursos,
    required this.main,
  }) : super(key: key);

  final List<Curso> cursos;
  final int index;
  final bool main;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            main
                ? Hero(
                    tag: cursos[index].id!,
                    child: Cursoimage(url: cursos[index].image!),
                  )
                : Cursoimage(url: cursos[index].image!),
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nombre: ${cursos[index].name}"),
                        Text("Capacidad: ${cursos[index].maxCapacity}"),
                        Text("Fecha Inicio: ${cursos[index].startDate}"),
                        Text("Fecha Fin: ${cursos[index].endDate}"),
                        Text("Precio: ${cursos[index].price}"),
                        Row(
                          children: [
                            const Text("Estado: "),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cursos[index].status == 0
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (main)
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/curso',
                              arguments: cursos[index]);
                        },
                        icon: const Icon(Icons.add))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cursoimage extends StatelessWidget {
  const Cursoimage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: 180,
      color: Colors.blue,
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    );
  }
}
