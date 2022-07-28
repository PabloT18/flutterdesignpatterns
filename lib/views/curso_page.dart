import 'package:app_patrones/factory_method/alert_dialogs/android_alert_dialog.dart';
import 'package:app_patrones/factory_method/alert_dialogs/ios_alert_dialog.dart';
import 'package:app_patrones/factory_method/custom_dialog.dart';
import 'package:app_patrones/logic/bloc/app_bloc.dart';
import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/models/docente.dart';
import 'package:app_patrones/views/curso_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CursoPage extends StatelessWidget {
  CursoPage({Key? key, required this.curso}) : super(key: key);

  List<CustomDialog> customDialogList = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  final Curso curso;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformwidgetsCubit, PlatformState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.widgetsFactory.createAppBar(title: "Curso"),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Hero(
                tag: curso.id!,
                child: Cursoimage(url: curso.image!),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre: ${curso.name}"),
                    Text("Categoria: ${curso.price}"),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        final Docente docente = (state as AppLoaded).docente;
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Docente"),
                              Text("Nombre: ${docente.name}"),
                              Text("Apellido: ${docente.lastName}"),
                              Text("Correo: ${docente.email}"),
                              Text("Cedula: ${docente.id}"),
                              Text("Titulo: ${docente.academicTitle}"),
                              Text("Numero: ${docente.telephone}"),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<AppBloc>().add(SetCurso(curso: curso));
                            _showCustomDialog(context, state.platformIsAndorid);
                          },
                          child: const Text("Agregar Curso")),
                    )
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Future _showCustomDialog(BuildContext context, bool isAndroid) async {
    final selectedDialog =
        isAndroid ? customDialogList[0] : customDialogList[1];

    await selectedDialog.show(context);
  }
}
