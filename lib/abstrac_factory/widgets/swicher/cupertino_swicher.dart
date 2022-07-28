import 'package:flutter/cupertino.dart';

class CupertinoSwicher extends StatelessWidget {
  const CupertinoSwicher({
    Key? key,
    required this.isActivare,
    required this.onChanged,
  }) : super(key: key);

  final bool isActivare;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: isActivare, onChanged: ((value) => onChanged(value)));
  }
}
