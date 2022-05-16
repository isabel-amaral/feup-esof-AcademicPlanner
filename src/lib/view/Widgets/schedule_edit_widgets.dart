import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/schedule_new_edit_widget.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  bool _areEditButtonsVisible = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [];

    if (_areEditButtonsVisible) {
      buttons.add(editButton('Editar Evento', Icons.edit));
      buttons.add(editButton('Alterar Visibilidade', Icons.remove));
      buttons.add(editButton('Adicionar Evento', Icons.add));
    }
    buttons.add(mainEditButton());

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: buttons);
  }

  Widget mainEditButton() {
    return Container(
      child: ElevatedButton(
        key: Key('schedule-edit-button'),
        child: Icon(
          (_areEditButtonsVisible) ? Icons.clear : Icons.edit,
          color: _darkRed,
        ),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8.0),
            primary: Theme.of(context).primaryColor,
            elevation: 10),
        onPressed: _toggleEditButtons,
      ),
    );
  }

  Widget editButton(String text, IconData icon) {
    String key;
    if (text == 'Editar Evento') {
      key = 'edit-activity-button';
    } else if (text == 'Alterar Visibilidade') {
      key = 'change-visibility-button';
    } else {
      key = 'add-activity-button';
    }

    return Container(
      width: 175,
      child: ElevatedButton(
        key: Key(key),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: TextStyle(
                  color: _darkRed,
                )),
            Icon(
              icon,
              color: _darkRed,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            padding: EdgeInsets.all(8.0),
            primary: Theme.of(context).primaryColor,
            elevation: 10),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return NewEditDialog();
              });
        },
      ),
    );
  }

  void _toggleEditButtons() {
    setState(() {
      _areEditButtonsVisible = !_areEditButtonsVisible;
    });
  }
}
