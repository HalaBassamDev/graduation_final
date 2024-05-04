import 'package:flutter/material.dart';
import 'package:splash_screen/employee_features/leavepage.dart';
import 'package:splash_screen/employee_features/overtime_emp.dart';
import 'package:splash_screen/profile/home.dart';

class hr_req extends StatefulWidget {
  const hr_req({super.key});

  @override
  State<hr_req> createState() => _hr_reqtate();
}

class _hr_reqtate extends State<hr_req> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFE5),
      body: Column(
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
                  "Request",
                  style: TextStyle(
                      fontFamily: "pop2",
                      fontSize: 16,
                      color: Color(0xFF034521)),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 35, left: 15, right: 15),
            decoration: BoxDecoration(
                color: const Color(0xFF034521),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4FFE5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "images/leave.png",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Leave request",
                      style: TextStyle(
                          fontFamily: "pop2",
                          fontSize: 16,
                          color: Color(0xFFF4FFE5)),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LeavePage()));
              },
            ),
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            decoration: BoxDecoration(
                color: const Color(0xFF034521),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4FFE5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "images/overtime.png",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Overtime request",
                      style: TextStyle(
                          fontFamily: "pop2",
                          fontSize: 16,
                          color: Color(0xFFF4FFE5)),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OvertimetPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
