import 'dart:async';
import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:splash_screen/employee_features/attendance_report.dart';
import 'package:splash_screen/profile/home.dart';
import 'package:splash_screen/variable.dart';

// ignore: must_be_immutable
class attendancePage extends StatefulWidget {
  static bool isCheck = false;
  attendancePage({super.key});
  @override
  State<attendancePage> createState() => _attendancePage();
}

class _attendancePage extends State<attendancePage> {
  static const double lat1 = 32.076193;
  static const double long1 = 36.090570;
  double lat2 = 0;
  double long2 = 0;

  StreamSubscription<Position>? positionStream;

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(lat1, long1), zoom: 14.4746);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  DateTime? date;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    if (positionStream != null) {
      positionStream!.cancel();
    }
    super.dispose();
  }

  Widget androidSwitch(bool val, Function(bool) OnChange) => Transform.scale(
        scale: 0.75,
        child: Switch(
            activeColor: const Color(0xFF034521),
            activeTrackColor: const Color.fromRGBO(244, 255, 229, 1),
            inactiveThumbColor: const Color(0xFF034521),
            inactiveTrackColor: Colors.grey.shade400,
            splashRadius: 50.0,
            value: val,
            onChanged: OnChange),
      );

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double deviceWidth = mediaQueryData.size.width;
    double deviceHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 255, 229, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: deviceHeight / 2,
              width: deviceWidth,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(30)),
                      child: Image.asset(
                        'images/map.png',
                        height: deviceHeight / 2 - 100,
                        width: deviceWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          employeeHomePage()));
                            },
                            shape: const CircleBorder(),
                            minWidth: 60,
                            height: 60,
                            color: const Color(0xFF034521),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xFFE0FBBB),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: deviceWidth / 4.5, top: 20),
                            child: const Text(
                              'Attendance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF034521),
                                fontSize: 15,
                                fontFamily: 'pop1',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: deviceWidth,
              height: deviceHeight / 2 + 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(3, 69, 33, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Attendance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF3FFE4),
                        fontSize: 15,
                        fontFamily: 'pop1',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minWidth: deviceWidth / 2.2,
                        height: 100,
                        color: const Color.fromRGBO(255, 196, 4, 1),
                        onPressed: () {
                          setState(() {
                            if (!employee.isCheck) {
                              date = DateTime.now();
                              employee.checkInTime =
                                  DateFormat('h:mm a').format(date!);
                              employee.checkInDate =
                                  DateFormat('E dd, MMM').format(date!);
                              employee.isCheck = true;
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Image.asset(
                                          "images/success.png",
                                          height: 200,
                                          width: 200,
                                        ),
                                        content: const Text(
                                          'You are already check in',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF034521),
                                            fontSize: 16,
                                            fontFamily: 'pop1',
                                            fontWeight: FontWeight.w700,
                                            height: 0.08,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10, bottom: 45),
                                        titlePadding: const EdgeInsets.all(0),
                                        backgroundColor: const Color.fromRGBO(
                                            244, 255, 229, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ));
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                'Check in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF034521),
                                  fontSize: 15,
                                  fontFamily: 'pop1',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                (employee.checkInTime != null)
                                    ? "${employee.checkInTime}"
                                    : "--:--",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF67A21A),
                                  fontSize: 15,
                                  fontFamily: 'pop1',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minWidth: deviceWidth / 2.2,
                        height: 100,
                        color: const Color.fromRGBO(255, 196, 4, 1),
                        onPressed: () {
                          setState(() {
                            if (!employee.isCheck) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Image.asset(
                                          "images/failed.png",
                                          height: 200,
                                          width: 200,
                                        ),
                                        content: const Text(
                                          'You must check in first',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF034521),
                                            fontSize: 16,
                                            fontFamily: 'pop1',
                                            fontWeight: FontWeight.w700,
                                            height: 0.08,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10, bottom: 45),
                                        titlePadding: const EdgeInsets.all(0),
                                        backgroundColor: const Color.fromRGBO(
                                            244, 255, 229, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ));
                            } else if (employee.checkOutTime != null) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Image.asset(
                                          "images/success.png",
                                          height: 200,
                                          width: 200,
                                        ),
                                        content: const Text(
                                          'You are already check out',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF034521),
                                            fontSize: 16,
                                            fontFamily: 'pop1',
                                            fontWeight: FontWeight.w700,
                                            height: 0.08,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10, bottom: 45),
                                        titlePadding: const EdgeInsets.all(0),
                                        backgroundColor: const Color.fromRGBO(
                                            244, 255, 229, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ));
                            } else {
                              date = DateTime.now();
                              employee.checkOutTime =
                                  DateFormat('h:mm a').format(date!);
                              employee.checkOutDate =
                                  DateFormat('dd/MM/yyyy').format(date!);
                              employee.addAttendance(
                                employee.checkOutDate!,
                                employee.checkInTime!,
                                employee.checkOutTime!,
                              );
                              employee.isCheck = true;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text(
                                'Check out',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF034521),
                                  fontSize: 15,
                                  fontFamily: 'pop1',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                (employee.checkOutTime != null)
                                    ? "${employee.checkOutTime}"
                                    : "--:--",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF67A21A),
                                  fontSize: 15,
                                  fontFamily: 'pop1',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: deviceWidth / 2.2,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 196, 4, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Break start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF034521),
                                    fontSize: 15,
                                    fontFamily: 'pop1',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/start.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  androidSwitch(
                                    employee.start,
                                    (value) {
                                      setState(() {
                                        employee.start = value;
                                        if (!value) {
                                          employee.end = false;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: deviceWidth / 2.2,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 196, 4, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Break end',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF034521),
                                    fontSize: 15,
                                    fontFamily: 'pop1',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/end.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  androidSwitch(
                                    employee.end,
                                    (value) {
                                      setState(() {
                                        if (employee.start)
                                          employee.end = value;
                                        else
                                          employee.end = false;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    heightFactor: 1.65,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      attendanceReportPage())));
                        },
                        child: const Text(
                          'View Attendance report?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'pop1',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //this method to
  // ( check if gps is enabled in user device )
  // ( check if permissiom is gived to app )
  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("object");
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Image.asset(
                  "images/success.png",
                  height: 200,
                  width: 200,
                ),
                content: const Text(
                  'Location services are disabled (GPS).',
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
              ));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Image.asset(
                    "images/success.png",
                    height: 200,
                    width: 200,
                  ),
                  content: const Text(
                    'Location is not enabled',
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
                ));
      }
    }
    if (permission == LocationPermission.always) {
      positionStream = Geolocator.getPositionStream().listen((position) {
        print(position);
        print(position.latitude);
        print(position.longitude);
        lat2 = position.latitude;
        long2 = position.longitude;
        double distance = Geolocator.distanceBetween(lat1, long1, lat2, long2);
        print(distance);
      });
      // Position position = await Geolocator.getCurrentPosition();
    }
  }
}
