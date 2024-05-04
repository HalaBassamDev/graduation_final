import 'package:flutter/material.dart';
import 'package:splash_screen/Work_contract.dart';
import 'package:splash_screen/profile/home.dart';
import 'package:splash_screen/employee_features/recivedDoc.dart';

class EmployeeDocument extends StatefulWidget {
  const EmployeeDocument({super.key});

  @override
  State<EmployeeDocument> createState() => _EmployeeDocumenttate();
}

class _EmployeeDocumenttate extends State<EmployeeDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFE5),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 13),
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
                padding: EdgeInsets.only(top: 38, left: 50),
                child: Text(
                  "Employee Document",
                  style: TextStyle(
                      fontFamily: "pop1",
                      fontSize: 16,
                      color: Color(0xFF034521)),
                ),
              )
            ],
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            decoration: BoxDecoration(
                color: const Color(0xFF034521),
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Color(0xFFF4FFE5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "images/warning.png",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Warning",
                      style: TextStyle(
                          fontFamily: "pop1",
                          fontSize: 16,
                          color: Color(0xFFF4FFE5)),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const warningEmp()));
              },
            ),
          ),
          Container(
            height: 85,
            margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
                        color: Color(0xFFF4FFE5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "images/workcon.png",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Work contract",
                      style: TextStyle(
                          fontFamily: "pop1",
                          fontSize: 16,
                          color: Color(0xFFF4FFE5)),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const workcontract()));
              },
            ),
          )
        ],
      ),
    );
  }
}
