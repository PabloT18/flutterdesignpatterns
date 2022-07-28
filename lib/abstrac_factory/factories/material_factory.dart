import 'package:app_patrones/abstrac_factory/platform_factory.dart';
import 'package:app_patrones/abstrac_factory/widgets/appbars/material_appbar.dart';
import 'package:app_patrones/abstrac_factory/widgets/loaders/material_loader.dart';
import 'package:app_patrones/abstrac_factory/widgets/swicher/material_swocher.dart';
import 'package:flutter/material.dart';

class MaterialFactory implements PlatformWidgetsFactory {
  @override
  PreferredSizeWidget createAppBar(
          {required String title, List<Widget>? actions}) =>
      MaterialAppBar(title: title, actions: actions);

  @override
  Widget createLoader() => const MaterialLoader();

  @override
  Widget createSwicher(
          {required bool isActivate, required Function(bool) onChanged}) =>
      MatrialSwicher(
        isActivare: isActivate,
        onChanged: onChanged,
      );
}
