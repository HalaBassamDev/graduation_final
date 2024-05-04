import 'package:flutter/material.dart';
import 'package:splash_screen/variable.dart';

double? difference;
int hours = 0;
int minutes = 0;

Widget showAttendanceReport() {
  if (employee.attendance != null && employee.attendance.isNotEmpty) {
    return ListView.builder(
      itemCount: employee.attendance.length,
      itemBuilder: (context, index) {
        final attendance = employee.attendance[index];
        String? differenceString = attendance['difference'];

        if (differenceString != null && differenceString.isNotEmpty) {
          difference = double.parse(differenceString);
          hours = difference!.toInt();
          minutes = ((difference! - hours) * 60).toInt();
        }
        return Card(
          color: const Color.fromRGBO(3, 69, 33, 0.8),
          child: ListTile(
            title: Text(
              '${attendance['date']}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Transform.rotate(
                      angle: 45 * 3.14 / 180,
                      child: const Icon(
                        Icons.arrow_forward_outlined,
                        color: Color.fromRGBO(102, 214, 14, 1),
                        size: 24,
                      ),
                    ),
                    Text(
                      '${attendance['checkInTime']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_outward_outlined,
                      color: Color.fromRGBO(5, 133, 252, 1),
                      size: 24,
                    ),
                    Text(
                      '${attendance['checkOutTime']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: SizedBox(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$hours:${minutes.toString().padLeft(2, '0')} Hours',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  showDedection(index)
                ],
              ),
            ),
          ),
        );
      },
    );
  } else {
    return const Center();
  }
}

Widget showDedection(index) {
  final attendance = employee.attendance[index];
  //String? overTime = attendance['overTime'];
  //String? late = attendance['late'];
  if (difference != null) if (hours == 8 && minutes == 0) {
    return const Text(
      'In time',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF65D50E),
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  } else if (hours == 8 && minutes > 0) {
    String overTimeString = employee.attendance[index]['overTime'] ?? '';
    return const Text(
      'Over time: min',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFFFC403),
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  } else if (hours < 8) {
    print(employee.attendance[index]['overTime']);
    return const Text(
      'Late: min',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFEA1212),
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  } else if (hours > 8) {
    return const Text(
      'Over time(30min)',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFFFC403),
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  return Container();
}
