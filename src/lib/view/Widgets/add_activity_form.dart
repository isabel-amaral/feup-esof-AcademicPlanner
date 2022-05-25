import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class AddActivityDialog extends StatefulWidget {
  @override
  _AddActivityDialogState createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _startTimeCtrl = TextEditingController();
  final TextEditingController _endTimeCtrl = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
        title: Text(
          'Novo Evento',
          textAlign: TextAlign.center,
        ),
        content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
          children: [
            createTextField('Nome', 'ex. Jantar de Curso'),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createTextField('Descrição', 'ex. Dress code: formal'),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createDateField(context),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createTimeField('Hora inicial', _startTimeCtrl),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createTimeField('Hora final', _endTimeCtrl),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createFrequencyField(context),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createColorField(context),
          ],
        )),
        
        actions: [
          /*TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Accept'))
        */]);
  }

  Widget createTextField(String labelText, String hintText) {
    return TextFormField(
        cursorColor: _darkRed,
        decoration: formFieldDecoration(hintText, labelText));
  }

  Widget createDateField(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _dateCtrl,
      onTap: () async {
        // Below line stops keyboard from appearing
        FocusScope.of(context).requestFocus(FocusNode());
        // Show Date Picker Here
        await _selectDate(context);
        _dateCtrl.text = DateFormat('yyyy/MM/dd').format(date);
      },
      decoration: formFieldDecoration('', 'Data'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Data requerida.';
        }
        return null;
      },
    );
  }

  Widget createTimeField(String labelText, TextEditingController controller) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: controller,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        await _selectTime(context);
        controller.text = startTime.format(context);
      },
      decoration: formFieldDecoration('', labelText),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Hora requerida.';
        }
        return null;
      },
    );
  }

  Widget createFrequencyField(BuildContext context) {
    return DropdownButtonFormField(
        decoration: formFieldDecoration('Escolhe uma frequência', 'Frequência'),
        items: <String>[
          'Não repetir',
          'Todos os dias',
          'Todas as semanas',
          'Todos os meses'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {});
  }

  Widget createColorField(BuildContext context) {
    return DropdownButtonFormField(
        decoration: formFieldDecoration('Escolhe uma cor', 'Cor'),
        items: <Color>[
          Colors.yellow,
          Colors.blue,
          Colors.red,
          Colors.green,
          Colors.purple,
          Colors.brown
        ].map<DropdownMenuItem<Color>>((Color value) {
          return DropdownMenuItem<Color>(
            value: value,
            child: Text('                                           ',
                style: TextStyle(backgroundColor: value)),
          );
        }).toList(),
        onChanged: (Color newValue) {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context)
                .copyWith(colorScheme: ColorScheme.light(primary: _darkRed)),
            child: child,
          );
        });

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final now = TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: now,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context)
                .copyWith(colorScheme: ColorScheme.light(primary: _darkRed)),
            child: child,
          );
        });
    if (picked != null && picked != date) {
      setState(() {
        startTime = picked;
      });
    }
  }

  InputDecoration formFieldDecoration(String hintText, labelText) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: _darkRed)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black));
  }
}
