import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen/Button.dart';
import 'package:splash_screen/component.dart';
import 'package:splash_screen/profile/home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController EmployeeID = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFE5),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Positioned(
                  top: -235,
                  left: -110,
                  child: Image(
                    image: AssetImage('images/Polygon4.png'),
                  ),
                ),
                const Positioned(
                  top: -120,
                  right: -320,
                  child: Image(
                    image: AssetImage('images/Ellipse9.png'),
                  ),
                ),
                const Positioned(
                  top: 400,
                  left: -280,
                  child: Image(
                    image: AssetImage('images/Vector1.png'),
                  ),
                ),
                Positioned(
                  left: -150,
                  top: 18,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Color(0XFFEB1313)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Positioned(
                  left: 155,
                  top: 460,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Color(0XFFEB1313)),
                  ),
                )
              ],
            ),
            const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'OpenSans',
                color: Color(0xff034521),
              ),
            ),
            const Text(
              'Welcome to Alveary !',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Open',
                color: Color(0xff034521),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomWidget(
              hintText: 'Employee ID',
              MyController: EmployeeID,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomWidget(
              obscure: true,
              hintText: 'Password',
              MyController: Password,
            ),
            Container(
              padding: const EdgeInsets.only(left: 220),
              child: TextButton(
                onPressed: () async {
                  if (EmployeeID.text == "") {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: "Email need to be written",
                            desc:
                                "Please write the email to reset the password.")
                        .show();
                    return;
                  }
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: EmployeeID.text);
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: "Email is sent ",
                            desc:
                                "Reset password email has been sent ,please check your email and click on the link to reset the password.")
                        .show();
                  } catch (e) {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: "Email is incorrect",
                            desc:
                                "make sure that the email yo enterred is correct")
                        .show();
                  }
                  // Navigator.pop(context);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const Forgetp1()));
                },
                child: const Text(
                  textAlign: TextAlign.center,
                  'Forget Password',
                  style: TextStyle(
                      color: Color(0xFF034521),
                      fontFamily: 'Open2',
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Button(
              title: 'Sign in',
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: EmployeeID.text, password: Password.text);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => employeeHomePage()));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');

                    /*  AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'No user found for that email.',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {})
                      ..show();
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Wrong password provided for that user.',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {})
                      ..show();*/
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
