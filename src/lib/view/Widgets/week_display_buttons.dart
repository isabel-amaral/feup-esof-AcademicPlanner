import 'package:flutter/material.dart';

class WeekDisplayButtons extends StatelessWidget {
  final DateTime start;
  final DateTime end;
  final Function callback;

  const WeekDisplayButtons(
      {Key key,
        @required this.start,
        @required this.end,
        @required this.callback}) : super(key: key);

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
                   onPressed: () {
                     final DateTime weekStartDate = start.add(Duration(days: -7));
                     final DateTime weekEndDate = start.add(Duration(days: -1));
                     callback(weekStartDate, weekEndDate);
                   }
               ),
               ElevatedButton.icon(
                   icon: Text('Semana Seguinte'),
                   label: Icon(Icons.navigate_next),
                   style: style,
                   onPressed: () {
                     final DateTime weekStartDate = end.add(Duration(days: 1));
                     final DateTime weekEndDate = end.add(Duration(days: 7));
                     callback(weekStartDate, weekEndDate);
                   }
               )
            ]
        )
    );
  }
}