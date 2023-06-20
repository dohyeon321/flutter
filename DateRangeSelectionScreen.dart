import 'package:flutter/material.dart';

class TimeTablePage0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _startDate;
  late DateTime _endDate;
  List<String> _selectedTimeSlots = [];

  void _selectDateRange(DateTime start, DateTime end) {
    setState(() {
      _startDate = start;
      _endDate = end;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimeTablePage(
          startDate: _startDate,
          endDate: _endDate,
          selectedTimeSlots: _selectedTimeSlots,
        ),
      ),
    ).then((value) {
      if (value != null && value is List<String>) {
        setState(() {
          _selectedTimeSlots = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2024),
            ).then((selectedStartDate) {
              if (selectedStartDate != null) {
                showDatePicker(
                  context: context,
                  initialDate: selectedStartDate,
                  firstDate: selectedStartDate,
                  lastDate: DateTime(2024),
                ).then((selectedEndDate) {
                  if (selectedEndDate != null) {
                    _selectDateRange(selectedStartDate, selectedEndDate);
                  }
                });
              }
            });
          },
          child: Text(
            'Select Date Range',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class TimeTablePage extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final List<String> selectedTimeSlots;

  TimeTablePage({
    required this.startDate,
    required this.endDate,
    required this.selectedTimeSlots,
  });

  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  List<List<bool>> _isTimeSlotSelected = [];

  @override
  void initState() {
    super.initState();
    _initializeTimeTable();
  }

  void _initializeTimeTable() {
    DateTime tempDate = widget.startDate;
    while (tempDate.isBefore(widget.endDate.add(Duration(days: 1)))) {
      List<bool> timeSlots = List.generate(15, (index) => false);
      _isTimeSlotSelected.add(timeSlots);
      tempDate = tempDate.add(Duration(days: 1));
    }
  }

  void _toggleTimeSlotSelection(int row, int column) {
    setState(() {
      _isTimeSlotSelected[row][column] = !_isTimeSlotSelected[row][column];
    });
  }

  void _confirmSelection() {
    List<String> selectedTimeSlots = [];
    for (int row = 0; row < _isTimeSlotSelected.length; row++) {
      for (int column = 0; column < _isTimeSlotSelected[row].length; column++) {
        if (_isTimeSlotSelected[row][column]) {
          selectedTimeSlots.add('${row + 9}:00 ${column < 8 ? 'AM' : 'PM'}');
        }
      }
    }
    Navigator.pop(context, selectedTimeSlots);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, timeIndex) {
          List<Widget> timeSlotsWidgets = [];
          for (int i = 0; i < _isTimeSlotSelected.length; i++) {
            timeSlotsWidgets.add(
              GestureDetector(
                onTap: () {
                  _toggleTimeSlotSelection(i, timeIndex);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: _isTimeSlotSelected[i][timeIndex] ? Colors.red : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '${i + 9}:00 ${timeIndex < 8 ? 'AM' : 'PM'}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          }
          return Row(children: timeSlotsWidgets);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _confirmSelection,
        child: Icon(Icons.check),
      ),
    );
  }
}
