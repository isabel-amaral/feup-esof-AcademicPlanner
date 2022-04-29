import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';


class CalendarPageView extends StatelessWidget {
  final List<Exam> exams;
  final List<Lecture> lectures;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> daysOfTheWeek;
  final TabController tabController;
  final ScrollController scrollViewController;

  CalendarPageView(
      {Key key,
        @required this.exams,
        @required this.lectures,
        @required this.startDate,
        @required this.endDate,
        @required this.daysOfTheWeek,
        @required this.tabController,
        this.scrollViewController});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Color labelColor = Color.fromARGB(255, 0x50, 0x50, 0x50);
    return Column(
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            PageTitle(name: 'Agenda'),
            TabBar(
              controller: tabController,
              unselectedLabelColor: labelColor,
              labelColor: labelColor,
              isScrollable: true,
              indicatorWeight: 3.0,
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: EdgeInsets.all(0.0),
              tabs: createTabs(queryData, context),
            )
          ]
        ),
        Expanded(
          child: TabBarView(
          controller: tabController,
          children: createSchedule(context),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
            child: Align (
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(8.0),
                  primary: Colors.white,
                  elevation: 10
                ),
                onPressed: () {
                  
                },
              ),
            ),
        ),
      ],
    );
  }

  List<Widget> createTabs(MediaQueryData queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];

    final DateTime nextWeek = startDate.add(Duration(days: 7));
    DateTime currentDay = startDate;
    while (currentDay != nextWeek) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width * 1 / 3,
        child: Tab(
            key: Key('calendar-page-tab-$currentDay'),
            child: Column(
                children: [
                  Text(daysOfTheWeek[currentDay.weekday-1]),
                  Text(currentDay.day.toString() + '/' + currentDay.month.toString())
                ])
        ),
      )
      );
      currentDay = currentDay.add(Duration(days: 1));
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

  Widget createDailySchedule(BuildContext context, int i) {
    final List<Widget> dailyActivities = [];
    for (Exam exam in exams) {
      if (exam.weekDay == daysOfTheWeek[i]) {
        dailyActivities.add(ScheduleRow(
            subject: exam.subject,
            rooms: exam.rooms,
            begin: exam.begin,
            end: exam.end,
            type: exam.examType));
      }
    }
    for (Lecture lecture in lectures) {
      if (lecture.day == i) {
        dailyActivities.add(ScheduleSlot(
            subject: lecture.subject,
            typeClass: lecture.typeClass,
            rooms: lecture.room,
            begin: lecture.startTime,
            end: lecture.endTime,
            teacher: lecture.teacher,
            classNumber: lecture.classNumber));
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: dailyActivities
    );
  }
}
