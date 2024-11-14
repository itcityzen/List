import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class tableCalendarForm extends StatefulWidget {
  const tableCalendarForm({super.key});

  @override
  State<tableCalendarForm> createState() => _tableCalendarFormState();
}

class _tableCalendarFormState extends State<tableCalendarForm> {
  DateTime Today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime FocuseDay) {
    setState(() {
      Today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan[50],
        child: TableCalendar(
          focusedDay: Today,
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          calendarFormat: CalendarFormat.week,
          daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              weekdayStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          startingDayOfWeek: StartingDayOfWeek.saturday,
          rowHeight: 50,
          headerStyle: HeaderStyle(
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              formatButtonVisible: false,
              titleCentered: true),
          availableGestures: AvailableGestures.all,
          calendarStyle: CalendarStyle(
              weekendTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              defaultTextStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              isTodayHighlighted: true,
              todayDecoration:
                  BoxDecoration(color: Colors.purple, shape: BoxShape.circle)),
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(day, Today),
        ));
    ();
    ();
  }
}
