import 'package:flutter/material.dart';
import 'package:uni/model/entities/activity.dart';

class CreateActivities {
  List<Activity> activities = [];

  List<Activity> createActivities() {
    activities.add(Activity(
        name: 'jantar',
        description: 'jantar com grupo de esof',
        startingDate: DateTime(2022, 5, 19, 20),
        endingDate: DateTime(2022, 5, 19, 22, 30),
        colorLabel: Colors.green)
    );
    activities.add(Activity(
        name: 'reuniao ltw',
        description: 'reuniao projeto ltw',
        startingDate: DateTime(2022, 5, 12, 9, 30),
        endingDate: DateTime(2022, 5, 12, 11, 30),
        frequency: Frequency.everyWeek,
        colorLabel: Colors.red)
    );
    activities.add(Activity(
        name: 'Entrega esof',
        description: 'Fechar 2a iteraçao',
        startingDate: DateTime(2022, 5, 27, 18),
        endingDate: DateTime(2022, 5, 27, 20),
        frequency:Frequency.noRepetition,
        colorLabel: Colors.red)
    );
    return activities;
  }
}