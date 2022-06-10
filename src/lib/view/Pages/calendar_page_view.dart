import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/model/entities/activity.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Widgets/activity_slot.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/schedule_edit_widgets.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';
import 'package:uni/view/Widgets/week_display_buttons.dart';

const Color _darkRed = Color.fromARGB(255, 0x75, 0x17, 0x1e);

class CalendarPageView extends StatelessWidget {
  final List<Exam> exams;
  final List<Lecture> lectures;
  final List<Activity> activities;
  final List<Activity> limitedActivities;
  final List<Exam> hiddenExams;
  final List<Lecture> hiddenLectures;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> daysOfTheWeek;
  final Map<String, bool> flags;
  final TabController tabController;
  final ScrollController scrollViewController;
  final Function setDates;
  final Function setActivities;
  final Function toggleFlag;
  final Function setHiddenExams;
  final Function setHiddenLectures;

  CalendarPageView(
      {Key key,
      @required this.exams,
      @required this.lectures,
      @required this.activities,
      @required this.limitedActivities,
      @required this.hiddenExams,
      @required this.hiddenLectures,
      @required this.startDate,
      @required this.endDate,
      @required this.daysOfTheWeek,
      @required this.flags,
      @required this.tabController,
      @required this.setDates,
      @required this.setActivities,
      @required this.toggleFlag,
      @required this.setHiddenExams,
      @required this.setHiddenLectures,
      this.scrollViewController});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Color labelColor = Color.fromARGB(255, 0x50, 0x50, 0x50);

    return Column(children: [
      ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        PageTitle(name: 'Agenda'),
        WeekDisplayButtons(currentStartDate: startDate, setDates: setDates),
        TabBar(
          controller: tabController,
          unselectedLabelColor: labelColor,
          labelColor: labelColor,
          isScrollable: true,
          indicatorWeight: 3.0,
          indicatorColor: _darkRed,
          labelPadding: EdgeInsets.all(0.0),
          tabs: createTabs(queryData, context),
        )
      ]),
      Expanded(
        child: TabBarView(
          controller: tabController,
          children: createSchedule(context),
        ),
      ),
      Container(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: EditWidget(this.exams, this.lectures, this.activities,
                this.setActivities, this.toggleFlag),
          ))
    ]);
  }

  List<Widget> createTabs(MediaQueryData queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];

    final DateTime nextWeek = startDate.add(Duration(days: 7));
    DateTime currentDay = startDate;

    int i = 0;
    while (currentDay != nextWeek) {
      tabs.add(Container(
        width: queryData.size.width * 1 / 3,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border(bottom: BorderSide(width: 0.7, color: _darkRed))),
        child: Tab(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: Text(daysOfTheWeek[currentDay.weekday - 1],
                  style: TextStyle(fontWeight: FontWeight.bold),
                  key: Key('calendar-page-tab-weekday-$i'))),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: Text(
                currentDay.day.toString() + '/' + currentDay.month.toString(),
                key: Key('calendar-page-tab-day-$i')),
          )
        ])),
      ));
      currentDay = currentDay.add(Duration(days: 1));
      i++;
    }
    return tabs;
  }

  List<Widget> createSchedule(BuildContext context) {
    final List<Widget> tabBarViewContent = [];
    for (int i = 0; i < daysOfTheWeek.length; i++) {
      tabBarViewContent.add(createDailySchedule(context, i));
    }
    return tabBarViewContent;
  }

  bool isHiddenExam(Exam exam) {
    for (Exam hidden in hiddenExams) {
      if (hidden.subject == exam.subject
          && hidden.begin == exam.begin
          && hidden.end == exam.end
          && hidden.date == exam.date) {
        return true;
      }
    }
    return false;
  }

  bool isHiddenLecture(Lecture lecture) {
    for (Lecture hidden in hiddenLectures) {
      if (hidden.subject == lecture.subject && hidden.startTime == lecture.startTime
          && hidden.endTime == lecture.endTime && hidden.day == lecture.day) {
        return true;
      }
    }
    return false;
  }

  Widget createDailySchedule(BuildContext context, int i) {
    final List<Widget> dailyActivities = [];

      for (Exam exam in exams) {
        if (exam.weekDay == daysOfTheWeek[i] && (flags['delete'] || !isHiddenExam(exam))){
          dailyActivities.add(ScheduleRow(
              subject: exam.subject,
              rooms: exam.rooms,
              begin: exam.begin,
              end: exam.end,
              type: exam.examType,
              unhideCallback : () => {
                hiddenExams.
                removeWhere((element) => element.subject == exam.subject
                    && element.begin == exam.begin && element.end == exam.end),
                setHiddenExams(hiddenExams)
              },
              hideCallback: () => {
                hiddenExams.add(exam),
                setHiddenExams(hiddenExams)
              },
              flags: flags,
              isHidden: isHiddenExam(exam)));
        }
      }

    for (Activity activity in limitedActivities) {
      if (activity.startingDate.weekday == i + 1) {
        dailyActivities.add(ActivitySlot(
          name: activity.name,
          description: activity.description,
          begin: activity.startingDate,
          end: activity.endingDate,
          color: activity.colorLabel,
          deleteCallback: () => {
            activities.removeWhere(
              (element) => element.name == activity.name),
            setActivities(activities),
            toggleFlag('delete'),
          },
          flags: flags,
        ));
      }
    }

    for (Lecture lecture in lectures) {
      if (lecture.day == i && (flags['delete'] || !isHiddenLecture(lecture))) {
        dailyActivities.add(ScheduleSlot(
            subject: lecture.subject,
            typeClass: lecture.typeClass,
            rooms: lecture.room,
            begin: lecture.startTime,
            end: lecture.endTime,
            teacher: lecture.teacher,
            classNumber: lecture.classNumber,
            unhideCallback: () => {
              hiddenLectures.
              removeWhere((element) => element.subject == lecture.subject
                  && element.startTime == lecture.startTime
                  && element.endTime == lecture.endTime
                  && element.day == lecture.day),
              setHiddenLectures(hiddenLectures)
            },
            hideCallback: () => {
              hiddenLectures.add(lecture),
              setHiddenLectures(hiddenLectures)
            },
            flags: flags,
            isHidden: isHiddenLecture(lecture)));
      }
    }

    if (dailyActivities.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Não existem atividades',
              style: TextStyle(fontSize: 17, color: _darkRed))
        ],
      );
    }

    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: dailyActivities,
    ));
  }
}
