// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:splash_screen/app/onbording2.dart';

class onpording1 extends StatelessWidget {
  const onpording1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFBAE581),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(
                  height: 1,
                ),
                const Positioned(
                  top: -95,
                  left: -140,
                  child: Image(
                    image: AssetImage(
                      'images/Polygon2.png',
                    ),
                  ),
                ),
                const Positioned(
                  top: 240,
                  right: 150,
                  child: Image(image: AssetImage('images/ellipse.png')),
                ),
                const Positioned(
                  top: 50,
                  left: 140,
                  child: Image(
                    image: AssetImage('images/Vector9.png'),
                  ),
                ),
                Positioned(
                  left: -150,
                  top: 70,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Color(0xFF034521)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Positioned(
                  left: 145,
                  top: 450,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Color(0xFF034521)),
                  ),
                )
              ],
            ),
            const Image(
              image: AssetImage('images/think.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Simplified Employee Administration',
                style: TextStyle(
                  color: Color(0XFF034521),
                  fontSize: 32,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Seamlessly monitor employee information , tasks, and performance, all within a single, integrated platform',
                style: TextStyle(
                  color: Color(0XFF034521),
                  fontSize: 16,
                  fontFamily: 'Open',
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 338, top: 30),
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
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFFA3D95D),
                    ),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
