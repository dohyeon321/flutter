import 'package:flutter/material.dart';
import 'package:projecttogether/basic.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'Range2.dart';

//0xff1d1647
//1번째 달력
class Calendar extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<Calendar> {
  List<Event> events = [];

  void showAddEventDialog(BuildContext context, DateTime selectedDate) async {
    String eventTitle = '';

    await showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text('일정추가'),
        content: TextField(
          onChanged: (value) {
            eventTitle = value;
          },
          decoration: InputDecoration(hintText: '일정을 입력해주세요'),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text('Add'),
            onPressed: () {
              saveEvent(eventTitle, selectedDate);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void saveEvent(String eventTitle, DateTime selectedDate) {
    setState(() {
      events.add(Event(title: eventTitle, date: selectedDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basic().appbar(),
      body: Column(
        children: [
          Container(
            height: 600,
            child: Column(
              children: [
                Expanded(
                  child: SfCalendar(
                    view: CalendarView.month,
                    onTap: (CalendarTapDetails details) {
                      if (details.targetElement ==
                          CalendarElement.calendarCell) {
                        showAddEventDialog(context, DateTime(2023));
                      }
                    },
                    dataSource: EventDataSource(events),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                _showDateRangePicker(context);
              },
              child: Text('일정생성',
                  style: TextStyle(fontSize: 20, color: Colors.white)))
        ],
      ),
      drawer: appbarRight(),
    );
  }
}

void _showDateRangePicker(BuildContext context) async {
  final DateTimeRange? result = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2022, 1, 1),
    lastDate: DateTime(2030, 12, 31),
    currentDate: DateTime.now(),
    saveText: 'Done',
  );

  if (result != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Rangetime(
          // startDate: result.start,
          // endDate: result.end,
          // selectedTimeSlots: [],
        ),
      ),
    );
  }
}
/*
class TimeTablePage extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  TimeTablePage({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the timetable page with time slots and selection logic
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
      ),
      body: Center(
        child: Text('Time Table Page'),
      ),
    );
  }
}*/

class Event {
  String title;
  DateTime date;

  Event({required this.title, required this.date});
}

class EventDataSource extends CalendarDataSource {
  List<Event> events;

  EventDataSource(this.events);

  @override
  DateTime getStartTime(int index) {
    return events[index].date;
  }

  @override
  DateTime getEndTime(int index) {
    return events[index].date.add(Duration(hours: 1)); // 예시로 1시간 추가
  }

  @override
  String getSubject(int index) {
    return events[index].title;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  int getCount() {
    return events.length;
  }
}
