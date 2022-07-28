import 'package:flutter/material.dart';

class MatrialSwicher extends StatelessWidget {
  const MatrialSwicher({
    Key? key,
    required this.isActivare,
    required this.onChanged,
  }) : super(key: key);

  final bool isActivare;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActivare,
      onChanged: onChanged,
    );
  }
}
