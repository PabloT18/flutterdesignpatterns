import 'package:flutter/material.dart';

abstract class PlatformWidgetsFactory {
  PreferredSizeWidget createAppBar({
    required String title,
    List<Widget>? actions,
  });

  Widget createLoader();

  Widget createSwicher({
    required bool isActivate,
    required Function(bool) onChanged,
  });
}
