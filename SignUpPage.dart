import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splash_screen/HR_features/addNewEmployee.dart';
import 'package:splash_screen/app/log.dart';
import 'package:splash_screen/payment/plan.dart';
import 'package:splash_screen/app/portal.dart';
import 'package:splash_screen/profile/HR_Homepage.dart';
import 'package:splash_screen/profile/home.dart';
import 'package:splash_screen/signin.dart';
import 'package:splash_screen/variable.dart';

//import 'package:splash_screen/plan.dart';

// ignore: camel_case_types
class signUP extends StatefulWidget {
  final String companyCode;
  const signUP({super.key, required this.companyCode});

  @override
  State<signUP> createState() => _signUPState();
}

class _signUPState extends State<signUP> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    show(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Image.asset(
                  "images/success.png",
                  height: 200,
                  width: 200,
                ),
                content: const Text(
                  'Emploee added successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF034521),
                    fontSize: 16,
                    fontFamily: 'pop1',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 10, right: 10, bottom: 45),
                titlePadding: const EdgeInsets.all(0),
                backgroundColor: const Color.fromRGBO(244, 255, 229, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              )).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => addEmployee()),
        );
      });
    }

    CollectionReference employees = FirebaseFirestore.instance
        .collection('companies')
        .doc('NewTech')
        .collection('employees');

    Future<void> addCompany() async {
      DocumentReference? reference = await employees
          .add({
            'employee id': id.text,
            'employee name': name.text,
            'job title': jobTitle.text,
            'email': email.text,
            'password': password.text
          })
          .then((value) => show(context))
          .catchError((error) => print("Failed to add user: $error"));
    }

    GlobalKey<FormState> form_1 = GlobalKey();
    final RegExp name1RegExp = RegExp(r'^[a-zA-Z]+$');
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final RegExp enumberRegExp = RegExp(r'^\d+$');
    final RegExp IDRegExp = RegExp(r'\b\d{7}\b');
    final RegExp PasswordRegExp =
        RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[a-z]).{8,}$');

    return Scaffold(
        backgroundColor: const Color(0XFFF4FFE5),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25, right: 335),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => addEmployee(),
                          ),
                        );
                      },
                      minWidth: 60,
                      height: 60,
                      color: const Color(0Xff034521),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0XFFF4FFE5),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    Positioned(
                      top: -50,
                      left: -90,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text(
                          'Add New Employee',
                          style: TextStyle(
                            color: Color(0xFF034521),
                            fontSize: 16,
                            fontFamily: 'pop1',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: form_1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          controller: id,
                          decoration: const InputDecoration(
                            hintText: 'ID',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ID cannot be empty";
                            } else if (!IDRegExp.hasMatch(value)) {
                              return 'Please enter only 7 numbers .';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty.";
                            } else if (!name1RegExp.hasMatch(value)) {
                              return "Please enter only letters.";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          controller: jobTitle,
                          decoration: const InputDecoration(
                            hintText: 'Job Title',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Job title cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!emailRegExp.hasMatch(value)) {
                              return 'invalid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          controller: password,
                          decoration: const InputDecoration(
                            hintText: 'Create Password',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (!PasswordRegExp.hasMatch(value)) {
                              return 'invalid password of emoloyees';
                            }
                            print(password.text);
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                          color: const Color(
                              0xFFD8F2B6), // Background color of the container
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        height: 50,
                        width: 390,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            contentPadding: EdgeInsets.only(bottom: 7),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFD8F2B6),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value != password.text) {
                              return 'The password does not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 2, right: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 11.5),
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          elevation: 6.0,
                          onPressed: () async {
                            if (form_1.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: (email.text.toString()),
                                  password: password.text,
                                );
                                addCompany();
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  addCompany();
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => hrHomePage()));
                            }
                          },
                          padding: const EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: const Color(0XFF034521),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              color: Color(0XFFFCFCFC),
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Image(
                        image: AssetImage('images/newemp.png'),
                        width: 290,
                        height: 290,
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
