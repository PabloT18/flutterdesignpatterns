import 'package:flutter/material.dart';

class MaterialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MaterialAppBar({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  final String title;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
