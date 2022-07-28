import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformwidgetsCubit, PlatformState>(
      builder: (context, state) {
        print(state.platformIsAndorid);
        return Scaffold(
          appBar: state.widgetsFactory.createAppBar(title: 'Configuracion'),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Plataforma Android'),
              ),
              state.widgetsFactory.createSwicher(
                  isActivate: state.platformIsAndorid,
                  onChanged: (_) =>
                      context.read<PlatformwidgetsCubit>().onChangePlatform())
            ],
          ),
        );
      },
    );
  }
}
