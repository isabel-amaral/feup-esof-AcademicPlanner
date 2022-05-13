import 'package:flutter/material.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class WeekDisplayButtons extends StatelessWidget {
  final DateTime currentStartDate;
  final Function callback;

  final int currentStartDay;
  final int currentStartMonth;
  final int currentStartYear;

  const WeekDisplayButtons(
      {Key key,
        @required this.currentStartDate,
        this.currentStartDay,
        this.currentStartMonth,
        this.currentStartYear,
        @required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(60),
    );
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 14),
      shape: shape,
      primary: _darkRed,
      onPrimary: Theme.of(context).primaryColor,
    );

    return Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child:
        Row(
            mainAxisSize:MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  key: Key('previous-week-button'),
                  label: Text('Semana Anterior'),
                  icon: Icon(Icons.navigate_before),
                  style: style,
                  onPressed: () {
                    final DateTime previousMonday =
                    currentStartDate.add(Duration(days: -7));
                    callback(previousMonday);
                  }
              ),
              ElevatedButton.icon(
                  key: Key('next-week-button'),
                  icon: Text('Semana Seguinte'),
                  label: Icon(Icons.navigate_next),
                  style: style,
                  onPressed: () {
                    final DateTime nextMonday =
                    currentStartDate.add(Duration(days: 7));
                    callback(nextMonday);
                  }
              )
            ]
        )
    );
  }
}
