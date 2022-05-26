import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/activity.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Widgets/activity_overlap_dialog.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class AddActivityDialog extends StatefulWidget {
  final List<Exam> exams;
  final List<Lecture> lectures;

  AddActivityDialog(this.exams, this.lectures);

  @override
  _AddActivityDialogState createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _startTimeCtrl = TextEditingController();
  final TextEditingController _endTimeCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  Color color;
  Frequency freq;

  @override
  void dispose() {
    _dateCtrl.dispose();
    _startTimeCtrl.dispose();
    _endTimeCtrl.dispose();
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

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
            createStartTimeField(),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            createEndTimeField(),
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
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                final Activity activity = Activity(
                  name: _nameCtrl.text,
                  description: _descCtrl.text,
                  startingDate: DateTime(date.year, date.month, date.day,
                    startTime.hour, startTime.minute),
                  endingDate: DateTime(date.year, date.month, date.day,
                    endTime.hour, endTime.minute),
                  frequency: freq,
                  colorLabel: color);
                if (checkForOverlap(activity)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ActivitityOverlapDialog();
                  });
                }
              },
              child: Text('Accept'))
        ]);
  }

  Widget createTextField(String labelText, String hintText) {
    return TextFormField(
      cursorColor: _darkRed,
      controller: labelText == 'Nome' ? _nameCtrl : _descCtrl,
      decoration: formFieldDecoration(hintText, labelText),
    );
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

  Widget createStartTimeField() {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _startTimeCtrl,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        await _selectStartTime(context);
        _startTimeCtrl.text = startTime.format(context);
      },
      decoration: formFieldDecoration('', 'Hora inicial'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Hora requerida.';
        }
        return null;
      },
    );
  }

  Widget createEndTimeField() {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _endTimeCtrl,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        await _selectEndTime(context);
        _endTimeCtrl.text = endTime.format(context);
      },
      decoration: formFieldDecoration('', 'Hora final'),
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
          'Todos os meses',
          'Todos os anos'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {
          if (newValue != null) {
            setState(() {
              switch (newValue) {
                case 'Não repetir':
                  freq = Frequency.noRepetition;
                  break;
                case 'Todos os dias':
                  freq = Frequency.everyDay;
                  break;
                case 'Todas as semanas':
                  freq = Frequency.everyWeek;
                  break;
                case 'Todos os meses':
                  freq = Frequency.everyMonth;
                  break;
                case 'Todos os anos':
                  freq = Frequency.everyYear;
                  break;
                default:
                  break;
              }
            });
          }
        });
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
        onChanged: (Color newValue) {
          if (newValue != null && newValue != color) {
            setState(() {
              color = newValue;
            });
          }
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(now.year + 10),
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

  Future<void> _selectStartTime(BuildContext context) async {
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
    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
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
    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
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

  bool checkForOverlap(Activity newActivity) {
    bool dateOverlap({int day = 0, int month = 0, int year = 0}) {
      final DateTime futureActivityDate = DateTime(
          newActivity.startingDate.year + year,
          newActivity.startingDate.month + month,
          newActivity.startingDate.day + day,
          newActivity.startingDate.hour,
          newActivity.startingDate.minute);

      for (Exam exam in this.widget.exams) {
        if (futureActivityDate.isBefore(DateTime(
                exam.date.year,
                exam.date.month,
                exam.date.day,
                int.parse(exam.end.split(':')[0]),
                int.parse(exam.end.split(':')[1]))) &&
            futureActivityDate.isAfter(DateTime(
                exam.date.year,
                exam.date.month,
                exam.date.day,
                int.parse(exam.begin.split(':')[0]),
                int.parse(exam.begin.split(':')[1])))) {
          return true;
        }
      }

      for (Lecture lecture in this.widget.lectures) {
        if (futureActivityDate.isBefore(DateTime(
                futureActivityDate.year,
                futureActivityDate.month,
                futureActivityDate.day,
                int.parse(lecture.endTime.split('h')[0]),
                int.parse(lecture.endTime.split('h')[1]))) &&
            futureActivityDate.isAfter(DateTime(
                futureActivityDate.year,
                futureActivityDate.month,
                futureActivityDate.day,
                int.parse(lecture.startTime.split('h')[0]),
                int.parse(lecture.startTime.split('h')[1])))) {
          return true;
        }
      }

      return false;
    }

    // Only look up to 5 years ahead
    final int searchLimit = 5;
    switch (newActivity.frequency) {
      case Frequency.noRepetition:
        return dateOverlap();
        break;
      case Frequency.everyDay:
        for (int d = 0; d < searchLimit * 365; d++) {
          if (dateOverlap(day: d)) {
            return true;
          }
        }
        return false;
        break;
      case Frequency.everyWeek:
        for (int d = 0; d < searchLimit * 365; d += 7) {
          if (dateOverlap(day: d)) {
            return true;
          }
        }
        return false;
        break;
      case Frequency.everyMonth:
        for (int m = 0; m < searchLimit * 12; m++) {
          if (dateOverlap(month: m)) {
            return true;
          }
        }
        return false;
        break;
      case Frequency.everyYear:
        for (int y = 0; y < searchLimit; y++) {
          if (dateOverlap(year: y)) {
            return true;
          }
        }
        return false;
        break;
      default:
        break;
    }

    /*
    for(Activity activity in activities) {
      if(newActivity.startingDate.isBefore(activity.endingDate) &&
          newActivity.endingDate.isAfter(activity.startingDate)) {

        return true;
      }
    }
    */
    return false;
  }
}
