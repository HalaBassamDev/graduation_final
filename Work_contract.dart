import 'package:flutter/material.dart';
import 'package:splash_screen/employee_features/emp_document.dart';

class workcontract extends StatefulWidget {
  const workcontract({super.key});

  @override
  State<workcontract> createState() => _workcontState();
}

class _workcontState extends State<workcontract> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 13),
                margin: EdgeInsets.zero,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EmployeeDocument()));
                  },
                  shape: const CircleBorder(),
                  minWidth: 60,
                  height: 60,
                  color: const Color(0xFF034521),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 65),
                child: Text(
                  "Work Contract",
                  style: TextStyle(
                      fontFamily: "pop2",
                      fontSize: 16,
                      color: Color(0xFF034521)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 25),
            decoration: BoxDecoration(
              color: const Color(0xFFFDCD2F),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.47), // shadow color
                  spreadRadius: 2, // spread radius
                  blurRadius: 3, // blur radius
                  offset: const Offset(0, 3), // only shadow bottom
                ),
              ],
            ),
            margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Image.asset("images/emma.png")),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Emma Joanne",
                            style: TextStyle(
                                fontFamily: "pop",
                                fontSize: 16,
                                color: Color(0xFF034521)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 130,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xFF034521),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3), // shadow color
                                spreadRadius: 2, // spread radius
                                blurRadius: 3, // blur radius
                                offset:
                                    const Offset(0, 3), // only shadow bottom
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            "UI/UX Designer",
                            style: TextStyle(
                                fontFamily: "pop",
                                fontSize: 10,
                                color: Color(0xFFF4FFE5)),
                          )),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      const Text(
                        "Employment  Date",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // shadow color
                              spreadRadius: 2, // spread radius
                              blurRadius: 3, // blur radius
                              offset: const Offset(0, 3), // only shadow bottom
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          "20 Jan, 2022",
                          style: TextStyle(
                              fontFamily: "pop2",
                              fontSize: 13,
                              color: Color(0xFF034521)),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Expiry  Date",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // shadow color
                              spreadRadius: 2, // spread radius
                              blurRadius: 3, // blur radius
                              offset: const Offset(0, 3), // only shadow bottom
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          "20 Jan, 2023",
                          style: TextStyle(
                              fontFamily: "pop2",
                              fontSize: 13,
                              color: Color(0xFF034521)),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Work Department",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // shadow color
                              spreadRadius: 2, // spread radius
                              blurRadius: 3, // blur radius
                              offset: const Offset(0, 3), // only shadow bottom
                            ),
                          ],
                        ),
                        child: const Center(
                            child: Text(
                          "IT Department",
                          style: TextStyle(
                              fontFamily: "pop2",
                              fontSize: 13,
                              color: Color(0xFF034521)),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Employee ID",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.3), // shadow color
                              spreadRadius: 2, // spread radius
                              blurRadius: 3, // blur radius
                              offset: const Offset(0, 3), // only shadow bottom
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "20366",
                            style: TextStyle(
                              fontFamily: "pop2",
                              fontSize: 13,
                              color: Color(0xFF034521),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
