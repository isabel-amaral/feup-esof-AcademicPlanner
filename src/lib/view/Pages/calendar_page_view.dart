import 'package:flutter/material.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Widgets/page_title.dart';


class CalendarPageView extends StatelessWidget {
  final List<Exam> exams;
  final List<Lecture> lectures;
  final List<String> daysOfTheWeek;
  final TabController tabController;
  final ScrollController scrollViewController;

  CalendarPageView(
      {Key key,
        @required this.exams,
        @required this.lectures,
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
            ),
          ],
        )
      ],
    );
  }

  createTabs(MediaQueryData queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width * 1 / 3,
        child: Tab(key: Key('schedule-page-tab-$i'), text: daysOfTheWeek[i]),
      ));
    }
    return tabs;
  }
}
