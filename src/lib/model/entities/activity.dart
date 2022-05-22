import 'package:flutter/widgets.dart';

/// Stores information about an extra activity.
///
/// The information stored is:
/// - Activity 'id'
/// - The 'name' of the activity
/// - The 'description' of the activity
/// - The 'startingDate' and 'endingDate' of the activity
/// - The activity 'frequency'
/// - The activity 'color label'

enum Frequency {
  noRepetition,
  everyDay,
  everyWeek,
  everyMonth,
  everyYear,
}

class Activity {
  String name;
  String description;
  DateTime startingDate;
  DateTime endingDate;
  Frequency frequency;
  Color colorLabel;

  Activity({
      @required String this.name,
      String this.description = '',
      @required DateTime this.startingDate,
      @required DateTime this.endingDate,
      Frequency this.frequency = Frequency.noRepetition,
      Color this.colorLabel = null});

  Map<String, dynamic> toMap(restaurantId) {
    return {
      'name': this.name,
      'description': this.description,
      'startingDate': this.startingDate,
      'endingDate': this.endingDate,
      'frequency': this.frequency,
      'colorLabel':this.colorLabel};
  }
}