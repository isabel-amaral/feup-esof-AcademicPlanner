import 'package:flutter/material.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class NewEditDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          'Novo Evento',
          textAlign: TextAlign.center,
        ),
        content: Form(
            child: Column(
          children: [
            createTextField('Nome'),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            createTextField('Descrição')
          ],
        )),
        actions: [
          TextButton(onPressed: () {}, child: Text('Cancel')),
          TextButton(onPressed: () {}, child: Text('Accept'))
        ]);
  }

  Widget createTextField(String field) {
    return TextFormField(
        cursorColor: _darkRed,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: _darkRed)),
            hintText: (field == 'Nome')
                ? 'ex. Jantar de Curso'
                : 'ex. Dress code: formal',
            labelText: field,
            labelStyle: TextStyle(color: Colors.black)));
  }
}
