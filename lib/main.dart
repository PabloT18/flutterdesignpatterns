import 'dart:io';

import 'package:app_patrones/logic/navigation/navigation_cubit.dart';
import 'package:app_patrones/logic/widgets/platformwidgets_cubit.dart';
import 'package:app_patrones/models/curso_model.dart';
import 'package:app_patrones/views/login_page.dart';
import 'package:app_patrones/views/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_patrones/logic/bloc/app_bloc.dart';

import 'package:app_patrones/views/home_page.dart';
import 'package:app_patrones/views/curso_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Platform.isAndroid;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc()..add(OnGetData()),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => PlatformwidgetsCubit(Platform.isAndroid),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

class AppRoutes {
  static const String loadingPage = '/';
  static const String cursoPage = '/curso';
  static const String homePage = '/home';
  static const String settingsPage = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('--------------------------------------${settings.name}');

    switch (settings.name) {
      case loadingPage:
        return _fadeRoute(const LoginPage(), loadingPage, settings: settings);

      case settingsPage:
        return _fadeRoute(const SettingsPage(), settingsPage,
            settings: settings);

      case homePage:
        return _fadeRoute(const HomePage(), homePage, settings: settings);

      case cursoPage:
        return _fadeRoute(
            CursoPage(curso: settings.arguments as Curso), cursoPage,
            settings: settings);

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _fadeRoute(Widget child, String routName,
      {required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Pagina No Encontrada posiblemente este en desarrollo'),
        ),
      );
    });
  }
}



///
/// Abstrac Factory
///  Creacion de Widgets para cada tipo de plataforma para mejor visualiacion
/// y experiencia de usuairo.
/// 
/// State 
///  Manejo de estado, aplicado en diferente partes de la placicaicon 
/// 
/// Observer
/// Escuchar los cambios de los estados, definidos con el State, para redibujar 
/// los componente, y tambien un ObserverGlobal para LOGS utilizado en el 
/// ambito de desarrollo de la APP.
/// 
/// 
/// Singleton
/// Implementacion 1=> Una unica instancia de una clase la cual maneja 
/// informacion del Estudiante
///
/// Factory 
/// el concepto de factory para la creacion de Objetos segun epecifiacion 
///   - Para el Onjeto Singleton 
///   - Para objetos modelos que se crearan segun la infromacion del consumo del 
///   servidor
/// 
/// como patron 
///   - Para crear diferentes tipos de AlertDialogs segun la platafroma  
