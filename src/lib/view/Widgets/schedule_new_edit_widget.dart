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
                createTextField('Descrição'),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                createDateButton(context),
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

  Widget createDateButton(BuildContext context){
    return OutlinedButton(
        onPressed: () {datePicker(context);},
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (states){
                    return EdgeInsets.symmetric(vertical:15, horizontal: 100);
                  }
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states){
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                );
              }
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
                  (states){
                    return BorderSide(color:  Colors.black);
                  }
          )
        ),
        child: Text('Data'));
  }

  datePicker(BuildContext context){
    DateTime now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, now.day),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 1, now.month, now.day),
      builder: (context, child){
        return Theme(
          data:Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: _darkRed
            )
          ),
          child: child,
        );
      }
    );
  }
}
