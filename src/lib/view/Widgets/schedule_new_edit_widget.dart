import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class NewEditDialog extends StatefulWidget {
  @override
  _NewEditDialogState createState() => _NewEditDialogState();
}

class _NewEditDialogState extends State<NewEditDialog> {
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
        title: Text(
          'Novo Evento',
          textAlign: TextAlign.center,
        ),
        content: Form(
            child: Column(
          children: [
            Flexible(child: createTextField('Nome')),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Flexible(child: createTextField('Descrição')),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Flexible(child: createDateField(context)),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Flexible(child: createTimeField('Hora inicial', _startTimeCtrl)),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Flexible(child: createTimeField('Hora final', _endTimeCtrl)),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Flexible(child: createFrequencyField(context)),
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
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: _darkRed)),
          hintText: DateFormat('yyyy/MM/dd').format(selectedDate),
          labelText: 'Data',
          labelStyle: TextStyle(color: Colors.black)),
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
        FocusScope.of(context).requestFocus(new FocusNode());
        await _selectTime(context);
         controller.text = startTime.format(context);
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: _darkRed)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black)),
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
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: _darkRed)),
            hintText: 'Frequência',
            labelText: 'Frequência',
            labelStyle: TextStyle(color: Colors.black)),
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
}
