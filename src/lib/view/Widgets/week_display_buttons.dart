import 'package:flutter/material.dart';

class WeekDisplayButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60),
    );
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),
      shape: shape,
      primary: Theme.of(context).primaryColor,
      onPrimary: Theme.of(context).hintColor,
    );

    return Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child:
        Row(
            mainAxisSize:MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               ElevatedButton.icon(
                   label: Text('Semana Anterior'),
                   icon: Icon(Icons.navigate_before),
                   style: style,
                   onPressed: () {/*TODO: issue #10 */ }
               ),
               ElevatedButton.icon(
                   icon: Text('Semana Seguinte'),
                   label: Icon(Icons.navigate_next),
                   style: style,
                   onPressed: () {/*TODO: issue #10 */ }
               )
            ]
        )
    );
  }
}