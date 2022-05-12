import 'package:flutter/material.dart';
import 'app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';
import 'entities/exam.dart';
import 'entities/lecture.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends SecondaryPageViewState
    with SingleTickerProviderStateMixin {
  final int weekDay = DateTime.now().weekday;

  TabController tabController;
  ScrollController scrollViewController;

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

  /// Limits exmas to the week in display -
  /// right now hardcoded values are being used
  // In the future we might need to change the logic of this method
  List<Exam> limitExams(exams) {
    final limitedExams = <Exam>[];

    for (Exam exam in exams) {
      if (exam.date.isAfter(startDate) && exam.date.isBefore(endDate)) {
        limitedExams.add(exam);
      }
    }
    return limitedExams;
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
