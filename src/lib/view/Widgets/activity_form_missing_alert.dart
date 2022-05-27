import 'package:flutter/material.dart';


class FormMissingValuesDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          'AVISO',
          textAlign: TextAlign.center,
        ),
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Existem campos não preenchidos',
          textAlign: TextAlign.center)
        ]
      ),
      actions: [
        TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Retornar',
              textAlign: TextAlign.center)),
      ]);
  }
}