import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  static DateTime startDay = DateTime.utc(2020, 1, 1);

  static int getCount(DateTime day) {
    var count = day.difference(startDay).inDays % 28;
    if (count == 0) {
      return 28;
    }
    return count.toInt();
  }

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();

  //starting day

  @override
  Widget build(BuildContext context) {
    Widget buildDayCell(
        {required BuildContext context, required DateTime day, required int dayCount, required Color textColor, required BoxDecoration decoration}) {
      return Container(
        decoration: decoration.copyWith(border: Border.all(color: Color(0xFFEEEEEE), width: 0.2), shape: BoxShape.rectangle),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${day.day}',
                    style: TextStyle(
                      color: dayCount < 5 ? Colors.white : textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$dayCount',
                    style: TextStyle(
                      color: dayCount < 5 ? Colors.white : textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              if (dayCount == 15)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset('assets/icons/ic_orange.svg'),
                )
              else if (dayCount < 5)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset('assets/icons/ic_blood.svg'),
                )
              else if (dayCount > 9 && dayCount < 17)
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset('assets/icons/ic_leaf.svg'),
                )
            ],
          ),
        ),
      );
    }

    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerVisible: false,
      rowHeight: 62,
      daysOfWeekHeight: 38,
      calendarBuilders: CalendarBuilders(
        prioritizedBuilder: (context, day, focusedDay) {
          return null;
        },
        defaultBuilder: (context, day, focusedDay) {
          var dayCount = CalendarScreen.getCount(day);
          return buildDayCell(
            context: context,
            day: day,
            textColor: Colors.black,
            dayCount: dayCount,
            decoration: BoxDecoration(
              color: (dayCount < 5) ? Color(0xFFFF699C) : Colors.white,
              shape: BoxShape.rectangle,
            ),
          );
        },
        rangeStartBuilder: (context, day, focusedDay) {
          return null;
        },
        rangeEndBuilder: (context, day, focusedDay) {
          return null;
        },
        outsideBuilder: (context, day, focusedDay) {
          var dayCount = CalendarScreen.getCount(day);
          return buildDayCell(
            context: context,
            day: day,
            textColor: Color(0xFFBDBDBD),
            dayCount: dayCount,
            decoration: BoxDecoration(color: (dayCount < 5) ? Color(0xFFFF699C) : Colors.white, shape: BoxShape.rectangle),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          var dayCount = CalendarScreen.getCount(day);
          return buildDayCell(
            context: context,
            day: day,
            textColor: Colors.white,
            dayCount: dayCount,
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.rectangle,
            ),
          );
        },
      ),
    );
  }
}
