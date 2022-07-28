part of 'platformwidgets_cubit.dart';

@immutable
class PlatformState {
  const PlatformState({
    required this.widgetsFactory,
    required this.platformIsAndorid,
  });
  final PlatformWidgetsFactory widgetsFactory;
  final bool platformIsAndorid;
}
