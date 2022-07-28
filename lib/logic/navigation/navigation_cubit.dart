import 'package:flutter_bloc/flutter_bloc.dart';

enum Tabs { cursos, miscursos }

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void onChangeIndex(int index) {
    if (index != state) emit(index);
  }

  int getIndex() {
    return state;
  }
}
