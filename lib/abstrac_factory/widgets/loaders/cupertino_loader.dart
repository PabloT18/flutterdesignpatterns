import 'package:flutter/cupertino.dart';

class CuepertinoLoader extends StatelessWidget {
  const CuepertinoLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator());
  }
}
