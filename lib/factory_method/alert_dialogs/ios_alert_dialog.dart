import 'package:flutter/cupertino.dart';

import '../custom_dialog.dart';

class IosAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return 'iOS Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text('Se ha agreago a sus cursos.'),
      actions: <Widget>[
        CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
