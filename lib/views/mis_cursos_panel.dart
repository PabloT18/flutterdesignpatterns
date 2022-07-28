import 'package:app_patrones/logic/bloc/app_bloc.dart';
import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:app_patrones/singleton/usuario_service.dart';
import 'package:app_patrones/views/cursos_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MisCursosPanel extends StatelessWidget {
  const MisCursosPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Estudiante estudiante = Estudiante.estudiante;
    return BlocBuilder<PlatformwidgetsCubit, PlatformState>(
      builder: (context, state) {
        final widgetsFactory = state.widgetsFactory;
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text("${estudiante.nombree} ${estudiante.apellidoo}"),
                  Text(estudiante.cedulaa),
                  Text(estudiante.correoo),
                ],
              ),
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state is AppLoaded) {
                  return Expanded(
                      child: ListCursos(
                    cursos: state.misCursos,
                    main: false,
                  ));
                } else if (state is AppError) {
                  return const Center(
                    child: Text('Erro al cargar datos.'),
                  );
                } else if (state is AppLoaded) {
                  return widgetsFactory.createLoader();
                }
                return widgetsFactory.createLoader();
              },
            )
          ],
        );
      },
    );
  }
}
