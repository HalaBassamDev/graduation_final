import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_screen/employee_features/attendance_emp.dart';
import 'package:splash_screen/employee_features/generate_report.dart';
import 'package:splash_screen/variable.dart';

class attendanceReportPage extends StatefulWidget {
  @override
  State<attendanceReportPage> createState() => _attendanceReportPage();
}

class _attendanceReportPage extends State<attendanceReportPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double deviceWidth = mediaQueryData.size.width;
    double deviceHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 255, 229, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => attendancePage()));
                    },
                    shape: const CircleBorder(),
                    minWidth: 60,
                    height: 60,
                    color: const Color(0xFF034521),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xFFE0FBBB),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: deviceWidth / 6),
                    child: const Text(
                      'Attendance Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF034521),
                        fontSize: 15,
                        fontFamily: 'pop1',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Attendance for ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF034521),
                      fontSize: 15,
                      fontFamily: 'pop1',
                    ),
                  ),
                  Text(
                    ' ${employee.getFormattedCurrentMonth()}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFFFCB721),
                      fontSize: 15,
                      fontFamily: 'pop1',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: deviceHeight - 700,
                width: deviceWidth,
                child: showAttendanceReport()),
          ],
        ),
      ),
    );
  }
}
