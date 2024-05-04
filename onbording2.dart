// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:splash_screen/app/onbording3.dart';

class onbording2 extends StatelessWidget {
  const onbording2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(
                  height: 1,
                ),
                const Positioned(
                  top: -110,
                  left: -120,
                  child: Image(
                    image: AssetImage(
                      'images/Polygon4.png',
                    ),
                  ),
                ),
                const Positioned(
                  top: 240,
                  right: 160,
                  child: Image(image: AssetImage('images/Ellipse4.png')),
                ),
                const Positioned(
                  top: 178,
                  left: 155,
                  child: Image(
                    image: AssetImage('images/Vectorr.png'),
                  ),
                ),
                Positioned(
                  left: -150,
                  top: 40,
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
                  left: 140,
                  top: 410,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Color(0xFF034521)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8000))),
              child: const Image(
                height: 390,
                width: 390,
                alignment: Alignment.center,
                image: AssetImage(
                  'images/bee.png',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                'Efficient Communication',
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
              padding: EdgeInsets.only(left: 15, right: 15),
              child: const Text(
                textAlign: TextAlign.left,
                'Offering enhanced communication channels with your team',
                style: TextStyle(
                  color: Color(0XFF034521),
                  fontSize: 16,
                  fontFamily: 'Open',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const onbording3()));
                      },
                      shape: const CircleBorder(),
                      minWidth: 60,
                      height: 60,
                      color: const Color(0xFF034521),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
          ],
        ));
  }
}
