import 'package:app_patrones/abstrac_factory/factories/cupertino_factory.dart';
import 'package:app_patrones/abstrac_factory/factories/material_factory.dart';
import 'package:app_patrones/abstrac_factory/platform_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'platfomwidgets_state.dart';

class PlatformwidgetsCubit extends Cubit<PlatformState> {
  PlatformwidgetsCubit(bool platformIsAndorid)
      : super(platformIsAndorid
            ? PlatformState(
                widgetsFactory: MaterialFactory(), platformIsAndorid: true)
            : PlatformState(
                widgetsFactory: CupertinoFactory(), platformIsAndorid: false));

  void onChangePlatform() {
    if (!state.platformIsAndorid) {
      emit(PlatformState(
          widgetsFactory: MaterialFactory(), platformIsAndorid: true));
    } else {
      emit(PlatformState(
          widgetsFactory: CupertinoFactory(), platformIsAndorid: false));
    }
  }
}
