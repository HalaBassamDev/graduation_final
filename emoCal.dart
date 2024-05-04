import 'package:flutter/material.dart';
import 'package:splash_screen/HR_features/HR_Schedual.dart';
import 'package:splash_screen/profile/home.dart';

import 'package:table_calendar/table_calendar.dart';

class emp_calendar extends StatefulWidget {
  const emp_calendar({Key? key}) : super(key: key);
  State<emp_calendar> createState() => _emp_calendarState();
}

@override
class _emp_calendarState extends State<emp_calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selecteDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 255, 229, 1),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    margin: EdgeInsets.zero,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => employeeHomePage()));
                      },
                      shape: const CircleBorder(),
                      minWidth: 60,
                      height: 60,
                      color: const Color(0xFF034521),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(0xFFF4FFE5),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 45, left: 88),
                      child: Text(
                        "Schedule",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'pop1',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(3, 69, 33, 1)),
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Container(
                margin: const EdgeInsets.all(40),
                padding: const EdgeInsets.all(15),
                height: 270,
                decoration: BoxDecoration(
                    color: const Color(0xfff4ffe5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xff7ca484),
                        offset: Offset(
                          0.5,
                          0.5,
                        ),
                        blurRadius: 10,
                        spreadRadius: 0.0,
                      ),
                    ]),
                child: TableCalendar(
                    headerVisible: true,
                    rowHeight: 35,
                    focusedDay: focusedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2250),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekVisible: true,
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selecteDay = selectDay;
                        focusedDay = focusDay;
                      });
                      print(focusDay);
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selecteDay, date);
                    },
                    calendarStyle: const CalendarStyle(
                        weekNumberTextStyle: TextStyle(
                          fontFamily: 'pop1',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF034521),
                        ),
                        defaultTextStyle: TextStyle(
                          color: Color(0xFF034521),
                          fontFamily: 'pop1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        weekendTextStyle: TextStyle(
                          color: Color(0xFF034521),
                          fontFamily: 'pop1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                            color: Color(0xff7AAF35), shape: BoxShape.circle),
                        selectedTextStyle: TextStyle(
                          fontFamily: 'pop1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF034521),
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color(0xffFDCD2F),
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: TextStyle(
                            fontFamily: 'pop1',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF034521))),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Color(0xFF034521),
                        fontFamily: 'pop1',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendStyle: TextStyle(
                        color: Color(0xFF034521),
                        fontFamily: 'pop1',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: BoxDecoration(),
                    ),
                    headerStyle: const HeaderStyle(
                        titleTextStyle: TextStyle(
                          color: Color(0xFF034521),
                          fontFamily: 'pop1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        headerPadding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0))),
              )),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFC404),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Meeting",
                    style: TextStyle(
                        color: Color(0xff034521),
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ]),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: const Color(0xff99D059),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Event",
                    style: TextStyle(
                        color: Color(0xff034521),
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ]),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color(0xffFDCD2F),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "TODAY Wed, 19 Dec",
                        style: TextStyle(
                            color: Color(0xff034521),
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 13),
                      height: 120,
                      width: 335,
                      decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0xffbfd6ba),
                              blurRadius: 4,
                              offset: Offset(4, 2), // Shadow position
                            ),
                          ],
                          color: const Color(0xff034521),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10:00 AM - 11:00 AM",
                            style: TextStyle(
                                color: Color(0xffF4FFE5),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Funder App",
                            style: TextStyle(
                                color: Color(0xffFDCD2F),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "UI Screen Review",
                            style: TextStyle(
                                color: Color(0xffFDCD2F),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "in office meeting  Room 10",
                            style: TextStyle(
                                color: Color(0xff66D60E),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xffFDCD2F),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "MON, 24 Dec",
                        style: TextStyle(
                            color: Color(0xff034521),
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 13),
                      height: 120,
                      width: 335,
                      decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0xffbfd6ba),
                              blurRadius: 4,
                              offset: Offset(4, 2), // Shadow position
                            ),
                          ],
                          color: const Color(0xff034521),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "11:00 AM - 2:00 PM",
                            style: TextStyle(
                                color: Color(0xffF4FFE5),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "GHAT GPT and AI Tools",
                            style: TextStyle(
                                color: Color(0xffFDCD2F),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "How AI effect the way we work",
                            style: TextStyle(
                                color: Color(0xffFDCD2F),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "online on Zoom",
                            style: TextStyle(
                                color: Color(0xff66D60E),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ])));
  }
}
