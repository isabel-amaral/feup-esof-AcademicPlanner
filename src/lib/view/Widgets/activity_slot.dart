import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Widgets/row_container.dart';

class ActivitySlot extends StatelessWidget {
  final String name;
  final String description;
  final DateTime begin;
  final DateTime end;
  final Color color;
  final VoidCallback deleteCallback;
  final Map<String, bool> flags;

  ActivitySlot({
    Key key,
    @required this.name,
    @required this.description,
    @required this.begin,
    @required this.end,
    @required this.color,
    @required this.deleteCallback,
    @required this.flags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowContainer(
        child: Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
      child: createActivitySlotRow(context),
    ));
  }

  Widget createActivitySlotRow(context) {
    return Container(
        key: Key(name),
        margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createActivitySlotPrimInfo(context),
        ));
  }

  Widget createActivityTime(String time, context) => createTextField(
      time,
      Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
      TextAlign.center);

  Widget createScheduleSlotTime(context) {
    return Column(
      children: <Widget>[
        createActivityTime(
            DateFormat('HH').format(this.begin) +
                'h' +
                DateFormat('mm').format(this.begin),
            context),
        createActivityTime(
            DateFormat('HH').format(this.end) +
                'h' +
                DateFormat('mm').format(this.end),
            context),
      ],
    );
  }

  List<Widget> createActivitySlotPrimInfo(context) {
    final nameTextField = createTextField(
        this.name,
        Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 5),
        TextAlign.center);

    final descriptionTextField = createTextField(
        this.description,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);

    return [
      createScheduleSlotTime(context),
      Column(children: <Widget>[
        Row(children: [nameTextField]),
        Row(children: [descriptionTextField])
      ]),
      flags['delete'] ? 
        createActivityDeleteButton()
        : createActivitySlotColor(),
    ];
  }

  Widget createActivityDeleteButton() {
    return IconButton(
      visualDensity: VisualDensity.compact,
      icon: Icon(Icons.delete),
      onPressed: deleteCallback,
    );
  }

  Widget createActivitySlotColor() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 10,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
          color: this.color),
    );
  }

  Widget createTextField(text, style, alignment) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
