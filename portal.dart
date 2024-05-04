import 'package:flutter/material.dart';
import 'package:splash_screen/app/log.dart';
import 'package:splash_screen/app/login_hr.dart';
import 'package:splash_screen/signin.dart';
import 'package:splash_screen/variable.dart';

// ignore: camel_case_types
class startingPage extends StatelessWidget {
  const startingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 70),
                  width: 114,
                  height: 84,
                ),
                Positioned(
                  top: -160,
                  left: -10,
                  child: Image.asset('images/Polygon1.png'),
                ),
                Positioned(
                  top: -40,
                  left: 255,
                  child: SizedBox(
                      height: 155,
                      width: 155,
                      child: Image.asset('images/Ellipse2.png')),
                ),
                Positioned(
                  top: 575,
                  right: 250,
                  child: SizedBox(
                      height: 155,
                      width: 155,
                      child: Image.asset('images/Vector2.png')),
                ),
                Positioned(
                  left: 250,
                  top: 585,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const ShapeDecoration(
                      color: Color.fromRGBO(253, 205, 47, 1),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: -70,
                  top: 40,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const ShapeDecoration(
                      color: Color.fromRGBO(253, 205, 47, 1),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Center(
                      child: Text("Let’s Get Started",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'OpenSans',
                            color: Color(0xFF034521),
                          )),
                    ),
                    const Text("pick an identity ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Open2',
                          color: Color(0xFF034521),
                        )),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const login()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 320,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFDCD2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 87,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "images/laptop.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    employee.isHR = false;
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const login()));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 29),
                                    width: 194,
                                    height: 150,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFBAE581),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 25,
                                          offset: Offset(0, 5),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 15),
                                          child: const Text(
                                            'Employee',
                                            style: TextStyle(
                                              color: Color(0xFF034521),
                                              fontSize: 16,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w800,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 3),
                                          child: const SizedBox(
                                            width: 333,
                                            child: Text(
                                              textAlign: TextAlign.left,
                                              "Enter your company's code and its corresponding confidential number to experience an exceptional journey.",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Open',
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      3, 69, 33, 1)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          employee.isHR = true;
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HR_Login()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: 320,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFDCD2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage(
                                    'images/coffe.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HR_Login()));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 9.2),
                                    width: 194,
                                    height: 150,
                                    decoration: const ShapeDecoration(
                                        color: Color(0xFFBAE581),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 25,
                                            offset: Offset(0, 5),
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 15),
                                          child: const Text(
                                            'Manger',
                                            style: TextStyle(
                                              color: Color(0xFF034521),
                                              fontSize: 16,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w800,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 3),
                                          child: const SizedBox(
                                            width: 333,
                                            child: Text(
                                              textAlign: TextAlign.left,
                                              "Welcome to Alvaery mobile app that will change the way you manage your team and human resources.",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Open',
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    3, 69, 33, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
