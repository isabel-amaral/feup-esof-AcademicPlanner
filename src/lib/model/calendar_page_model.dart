import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';
import 'entities/exam.dart';
import 'entities/lecture.dart';
import 'entities/activity.dart';

class CalendarPage extends StatefulWidget {
  final BuildContext context;

  CalendarPage({Key key, this.context}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarPageState(
      context: context
  );
}

class _CalendarPageState extends SecondaryPageViewState
    with SingleTickerProviderStateMixin {
  @override
  final BuildContext context;

  _CalendarPageState({this.context});

  final int weekDay = DateTime.now().weekday;

  TabController tabController;
  ScrollController scrollViewController;

  List<Activity> activities = [];

  /* startDate and endDate are the dates at which the school year begins/ends */
  //In the future these might have to be passed to CalendarPageView
  DateTime startDate = DateTime(2021, 10, 18);
  DateTime endDate = DateTime(2021, 7, 16);
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
      if (exam.date.isAfter(weekStartDate) && exam.date.isBefore(weekEndDate)) {
        limitedExams.add(exam);
      }
    }
    return limitedExams;
  }

  List<Activity> fetchActivities() {
    final studentID =
    StoreProvider.of<AppState>(context).state.content['profile'].email.substring(2,11);
    final _database = FirebaseDatabase.instance.ref();

    _database.child(studentID).get().then((snapshot) {
      final activities = <Activity>[];
      final Map<dynamic, dynamic> data = snapshot.value;

      for (String activity in data['activities'].keys) {
        final String name = activity;
        final String description = data['activities'][activity]['description'];
        final Frequency frequency = Frequency.values[data['activities'][activity]['frequency']];
        final Color colorLabel = Color(data['activities'][activity]['color-label']);

        final int day = data['activities'][activity]['day'];
        final int month = data['activities'][activity]['month'];
        final int year = data['activities'][activity]['year'];
        final int startHour = data['activities'][activity]['start-hour'];
        final int startMin = data['activities'][activity]['start-minute'];
        final int endHour = data['activities'][activity]['end-hour'];
        final int endMin = data['activities'][activity]['end-minute'];
        final DateTime startingDate = DateTime(year, month, day, startHour, startMin);
        final DateTime endingDate = DateTime(year, month, day, endHour, endMin);

        final Activity a = Activity(
            name: name,
            description: description,
            startingDate: startingDate,
            endingDate: endingDate,
            frequency: frequency,
            colorLabel: colorLabel);
        activities.add(a);
      }
      return activities;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: daysOfTheWeek.length);
    tabController.animateTo(0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget getBody(BuildContext context) {
    this.activities = fetchActivities();

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
      builder: (context, activities) {
        return CalendarPageView(
            exams: activities.item1,
            lectures: activities.item2,
            //TODO: add item3
            daysOfTheWeek: daysOfTheWeek,
            startDate: weekStartDate,
            endDate: weekEndDate,
            tabController: tabController,
            scrollViewController: scrollViewController,
            callback: setDates
        );
      },
    );
  }
}
