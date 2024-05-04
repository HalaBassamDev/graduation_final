import 'package:flutter/material.dart';
import 'package:splash_screen/app/onbording2.dart';
import 'package:splash_screen/signin.dart';

// ignore: camel_case_types
class onbording3 extends StatelessWidget {
  const onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0FBBB),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, right: 325),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const onbording2()));
              },
              shape: const CircleBorder(),
              minWidth: 60,
              height: 60,
              color: const Color(0xFF034521),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xffE0FBBB),
              ),
            ),
          ),
          const SizedBox(
            height: 128,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  const Positioned(
                    top: -220,
                    left: -109,
                    child: Image(
                      image: AssetImage(
                        'images/Polygon2.png',
                      ),
                    ),
                  ),
                  const Positioned(
                    top: -70,
                    left: 150,
                    child: Image(image: AssetImage('images/Ellipse4.png')),
                  ),
                  const Positioned(
                    top: 150,
                    right: 160,
                    child: Image(
                      image: AssetImage('images/Vector2.png'),
                    ),
                  ),
                  Positioned(
                    left: -160,
                    top: -50,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Color(0xFF034521)),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Positioned(
                    left: 155,
                    top: 320,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const ShapeDecoration(
                          shape: CircleBorder(), color: Color(0xFF034521)),
                    ),
                  )
                ],
              ),
              const Image(
                image: AssetImage('images/employees.png'),
                width: 300,
                height: 300,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 22),
                child: const Text(
                  'Simplified Hiring',
                  style: TextStyle(
                    color: Color(0XFF034521),
                    fontSize: 32,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: const Text(
                  'Rapidly identify and acquire top talent while enhancing the overall hiring process for greater efficiency',
                  style: TextStyle(
                    color: Color(0XFF034521),
                    fontSize: 16,
                    fontFamily: 'Open',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const companyCode()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minWidth: 370,
                    height: 60,
                    color: const Color(0xFF034521),
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 25),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
