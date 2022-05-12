import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  bool _areEditButtonsVisible = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    if (_areEditButtonsVisible) {
      buttons.add(editButton('Editar Evento', Icons.edit_attributes));
      buttons.add(editButton('Alterar Visibilidade', Icons.remove));
      buttons.add(editButton('Adicionar Evento', Icons.add));
    }
    buttons.add(mainEditButton());

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: buttons
    );
  }

  Widget mainEditButton() {
    return Container(
      child: ElevatedButton(
        child: Icon(
          (_areEditButtonsVisible) ? Icons.clear : Icons.edit,
          color: Theme.of(context).primaryColor,
        ),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8.0),
            primary: Colors.white,
            elevation: 10),
        onPressed: _toggleEditButtons,
      ),
    );
  }

  Widget editButton(String text, IconData icon) {
    return Container(
      width: 165,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            padding: EdgeInsets.all(8.0),
            primary: Colors.white,
            elevation: 10),
        onPressed: () {},
      ),
    );
  }

  void _toggleEditButtons() {
    setState(() {
      _areEditButtonsVisible = !_areEditButtonsVisible;
    });
  }
}
