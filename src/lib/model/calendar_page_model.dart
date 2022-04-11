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

  /* These hardcoded values were inserted temporarily
  only to show a first implementation of the display
  before the calendar is set up to show every day in the school year
  this particular week was chosen because it allows the display of both
  classes and several exams */
  DateTime startDate = DateTime(2022, 4, 18);
  DateTime endDate = DateTime(2022, 4, 24);
  final List<String> daysOfTheWeek = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];

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
    final offset = (weekDay > 5) ? 0 : (weekDay - 1) % 5;
    tabController.animateTo((tabController.index + offset));
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
            startDate: startDate,
            endDate: endDate,
            tabController: tabController,
            scrollViewController: scrollViewController);
      },
    );
  }
}
