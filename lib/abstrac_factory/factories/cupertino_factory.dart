import 'package:flutter/cupertino.dart';

import 'package:app_patrones/abstrac_factory/platform_factory.dart';

import 'package:app_patrones/abstrac_factory/widgets/appbars/cupertino_appbar.dart';
import 'package:app_patrones/abstrac_factory/widgets/loaders/cupertino_loader.dart';
import 'package:app_patrones/abstrac_factory/widgets/swicher/cupertino_swicher.dart';

class CupertinoFactory implements PlatformWidgetsFactory {
  @override
  PreferredSizeWidget createAppBar(
          {required String title, List<Widget>? actions}) =>
      CupertinoAppBar(title: title, actions: actions);

  @override
  Widget createLoader() => const CuepertinoLoader();

  @override
  Widget createSwicher(
          {required bool isActivate, required Function(bool) onChanged}) =>
      CupertinoSwicher(
        isActivare: isActivate,
        onChanged: onChanged,
      );
}
