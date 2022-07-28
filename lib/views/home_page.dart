import 'package:app_patrones/abstrac_factory/platform_factory.dart';
import 'package:app_patrones/logic/bloc/app_bloc.dart';

import 'package:app_patrones/logic/navigation/navigation_cubit.dart';
import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:app_patrones/main.dart';
import 'package:app_patrones/views/curso_card.dart';
import 'package:app_patrones/views/mis_cursos_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformwidgetsCubit, PlatformState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.widgetsFactory.createAppBar(title: 'Cursos', actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.settingsPage);
                },
                icon: const Icon(
                  Icons.settings,
                ))
          ]),
          bottomNavigationBar: const _BarNavigation(),
          body: BlocBuilder<NavigationCubit, int>(
            builder: (context, index) {
              return IndexedStack(
                index: index,
                children: [
                  _CurosPanel(
                    widgetsFactory: state.widgetsFactory,
                  ),
                  const MisCursosPanel()
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _CurosPanel extends StatelessWidget {
  const _CurosPanel({
    Key? key,
    required this.widgetsFactory,
  }) : super(key: key);

  final PlatformWidgetsFactory widgetsFactory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppLoaded) {
          // return ListCursos(key: const Key('home'), cursos: state.cursos);
          return SingleChildScrollView(
            child: Column(
              children: [
                ...state.cursos
                    .map(
                      (curso) => CursoCard(
                          main: true,
                          cursos: state.cursos,
                          index: state.cursos
                              .indexWhere((element) => element == curso)),
                    )
                    .toList()
              ],
            ),
          );
        } else if (state is AppError) {
          return const Center(
            child: Text('Erro al cargar datos.'),
          );
        } else if (state is AppLoaded) {
          return widgetsFactory.createLoader();
        }
        return widgetsFactory.createLoader();
      },
    );
  }
}

class _BarNavigation extends StatelessWidget {
  const _BarNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, index) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            context.read<NavigationCubit>().onChangeIndex(i);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Cursos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Mis Cursos',
            ),
          ],
        );
      },
    );
  }
}
