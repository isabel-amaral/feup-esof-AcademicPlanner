import 'package:flutter/material.dart';
import 'app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';
import 'entities/activity.dart';
import 'entities/exam.dart';
import 'entities/lecture.dart';
import 'utils/create_activities.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends SecondaryPageViewState
    with SingleTickerProviderStateMixin {
  final int weekDay = DateTime.now().weekday;

  final CreateActivities createActivities = CreateActivities();
  List<Activity> activities;

  TabController tabController;
  ScrollController scrollViewController;

  DateTime weekStartDate = DateTime.now().add(
      Duration (days: - (DateTime.now().weekday - 1)));
  DateTime weekEndDate = (DateTime.now().add(
      Duration (days: - (DateTime.now().weekday - 1)))).add(Duration (days: 6));
  final List<String> daysOfTheWeek = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];

  void setDates(DateTime start){
    setState((){
      this.weekStartDate = start;
      this.weekEndDate = start.add(Duration(days: 6));
    });
  }

  void setActivities(activities) {
    setState(() {
      this.activities = activities;
    });
  }

  /// Limits lectures to one week
  List<Lecture> limitLectures(lectures) {
    final limitedLectures = <Lecture>[];

    for (Lecture lecture in lectures) {
      if (lecture.day < 5) {
        limitedLectures.add(lecture);
      }
    }
    return limitedLectures;
  }

  /// Limits exams to the week in display
  List<Exam> limitExams(exams) {
    final limitedExams = <Exam>[];
    for (Exam exam in exams) {
      if (exam.date.isAfter(weekStartDate) &&
          exam.date.isBefore(weekEndDate)) {
        limitedExams.add(exam);
      }
    }
    return limitedExams;
  }

  List<Activity> limitActivities(activities) {
    final limitedActivities = <Activity>[];
    for (Activity activity in activities) {
      if (activity.frequency == Frequency.noRepetition &&
          activity.startingDate.isAfter(weekStartDate) &&
          activity.startingDate.isBefore(weekEndDate)) {
        limitedActivities.add(activity);
      }
      else if (activity.frequency == Frequency.everyDay) {
        for (int i = 0; i < daysOfTheWeek.length; i++) {
          final currentDay = weekStartDate.add(Duration (days: i));
          if (activity.startingDate.isBefore(currentDay)) {
            final numDays = currentDay.weekday - activity.startingDate.weekday;
            limitedActivities.add(
                Activity(
                    name: activity.name,
                    description: activity.description,
                    startingDate: activity.startingDate.add(Duration (days: numDays)),
                    endingDate: activity.endingDate.add(Duration (days: numDays)),
                    colorLabel: activity.colorLabel
                ));
          }
        }
      }
      else if (activity.frequency == Frequency.everyWeek &&
              (activity.startingDate.isBefore(weekStartDate) ||
              (activity.startingDate.isAfter(weekStartDate) &&
              (activity.startingDate.isBefore(weekEndDate))))) {
        final DateTime startingWeek =
        activity.startingDate.add(Duration (days: - (activity.startingDate.weekday - 1)));
        final numDays = weekStartDate.difference(startingWeek).inDays;
        limitedActivities.add(
            Activity(
                name: activity.name,
                description: activity.description,
                startingDate: activity.startingDate.add(Duration (days: numDays)),
                endingDate: activity.endingDate.add(Duration (days: numDays)),
                colorLabel: activity.colorLabel
            ));
      }
      else if (activity.frequency == Frequency.everyMonth &&
              (activity.startingDate.isBefore(weekStartDate) ||
              (activity.startingDate.isAfter(weekStartDate) &&
                  (activity.startingDate.isBefore(weekEndDate))))) {

        DateTime currentMonth = activity.startingDate;
        while (!currentMonth.isAfter(weekEndDate)) {
          final DateTime currentMonthStartWeek = currentMonth.add(
              Duration (days: - (DateTime.now().weekday - 1)));
          if ((currentMonthStartWeek.isAfter(weekStartDate) ||
              (currentMonthStartWeek.year == weekStartDate.year &&
                  currentMonthStartWeek.month == weekStartDate.month &&
                  currentMonthStartWeek.day == weekStartDate.day)) &&
              currentMonthStartWeek.isBefore(weekEndDate)) {
            limitedActivities.add(
                Activity(
                    name: activity.name,
                    description: activity.description,
                    startingDate: currentMonth,
                    endingDate: DateTime(currentMonth.year,
                        currentMonth.month, currentMonth.day,
                        activity.endingDate.hour, activity.endingDate.minute),
                    colorLabel: activity.colorLabel
                ));
            break;
          }
          currentMonth = currentMonth.add(Duration (days: 28));
        }
      }
      else if (activity.frequency == Frequency.everyYear &&
              (activity.startingDate.isBefore(weekStartDate) ||
              (activity.startingDate.isAfter(weekStartDate) &&
                  (activity.startingDate.isBefore(weekEndDate))))) {

        DateTime currentYear = activity.startingDate;
        while(!currentYear.isAfter(weekEndDate)) {
          final DateTime currentYearStartWeek = currentYear.add(
              Duration (days: - (DateTime.now().weekday - 1)));
          if ((currentYearStartWeek.isAfter(weekStartDate) ||
              (currentYearStartWeek.year == weekStartDate.year &&
                  currentYearStartWeek.month == weekStartDate.month &&
                  currentYearStartWeek.day == weekStartDate.day)) &&
              currentYearStartWeek.isBefore(weekEndDate)) {
            limitedActivities.add(
                Activity(
                    name: activity.name,
                    description: activity.description,
                    startingDate: currentYear,
                    endingDate: DateTime(currentYear.year,
                        currentYear.month, currentYear.day,
                        activity.endingDate.hour, activity.endingDate.minute),
                    colorLabel: activity.colorLabel
                ));
            break;
          }
          currentYear = DateTime(currentYear.year+1, currentYear.month, currentYear.day);
        }
      }
    }
    return limitedActivities;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: daysOfTheWeek.length);
    tabController.animateTo(0);
    activities = createActivities.createActivities();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<Exam>, List<Lecture>>>(
      converter: (store) {
        final DateTime monday = DateTime.now().add(
            Duration (days: - (DateTime.now().weekday - 1)));
        tabController.animateTo(0);
        if (monday.day == weekStartDate.day &&
            monday.month == weekStartDate.month &&
            monday.year == weekStartDate.year) {
          final offset = (weekDay > 7) ? 0 : (weekDay - 1) % 7;
          tabController.animateTo((tabController.index + offset));
        }

        final List<Exam> exams = store.state.content['exams'];
        final Map<String, bool> filteredExamTypes =
          store.state.content['filteredExams'];
        final List<Exam> filteredExams = limitExams(
            exams.where((exam) =>
            filteredExamTypes[Exam.getExamTypeLong(exam.examType)] ?? true)
                .toList()
        );

        final List<Lecture> lectures =
          limitLectures(store.state.content['schedule']);

        return Tuple2(filteredExams, lectures);
      },
      builder: (context, schedule) {
        final List<Activity> limitedActivities = limitActivities(activities);
        return CalendarPageView(
            exams: schedule.item1,
            lectures: schedule.item2,
            activities: List<Activity>.from(activities),
            limitedActivities: limitedActivities,
            daysOfTheWeek: daysOfTheWeek,
            startDate: weekStartDate,
            endDate: weekEndDate,
            tabController: tabController,
            scrollViewController: scrollViewController,
            setDates: setDates,
            setActivities: setActivities
        );
      },
    );
  }
}