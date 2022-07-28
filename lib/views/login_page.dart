import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:app_patrones/singleton/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformwidgetsCubit, PlatformState>(
        builder: (context, state) => Scaffold(
              appBar: state.widgetsFactory.createAppBar(title: 'Registro'),
              body: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('Pablo'),
                      ),
                      enabled: false,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('Torres'),
                      ),
                      enabled: false,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('juanperez@hotmail.com'),
                      ),
                      enabled: false,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        label: Text('0102789562'),
                      ),
                      enabled: false,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Estudiante(
                              apellido: "Torres",
                              cedula: '0102789562',
                              correo: 'juanperez@hotmail.com',
                              nombre: 'Pablo');

                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: const Text('Registrar')),
                  ],
                ),
              ),
            ));
  }
}
