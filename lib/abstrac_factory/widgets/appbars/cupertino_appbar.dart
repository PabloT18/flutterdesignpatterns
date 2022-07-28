import 'package:flutter/material.dart';

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CupertinoAppBar({
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
      backgroundColor: Colors.black,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
