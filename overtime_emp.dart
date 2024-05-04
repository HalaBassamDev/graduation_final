import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:splash_screen/employee_features/req_emp.dart';

class OvertimetPage extends StatelessWidget {
  const OvertimetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Overtime();
  }
}

class Overtime extends StatefulWidget {
  const Overtime({super.key});

  @override
  State<StatefulWidget> createState() => OvertimeRequest();
}

class OvertimeRequest extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  @override
  String? note;
  String _fileText = '';
  File? _file;
  PlatformFile? _platformFile;
  GlobalKey<FormState> notes = GlobalKey();
  late AnimationController loadingController;
  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (file != null && file.files.isNotEmpty) {
      // تم اختيار ملف، يمكنك استخدامه هنا
      _file = File(file.files.single.path!);
      _platformFile = file.files.first;

      // يمكنك إظهار رسالة تأكيد بأن الملف قد تم اختياره بنجاح
      print('File selected: ${_file!.path}');
    } else {
      // لم يتم اختيار ملف
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Please choose a file."),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }

    // تحقق من وجود ملف مختار قبل القيام بأي عمل آخر
    if (_file != null) {
      loadingController.forward(); // أو أي إجراء آخر
    }
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 255, 229, 1),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(_fileText),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3, left: 13),
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      color: Color.fromRGBO(3, 69, 33, 1),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const reqemployee()));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25,
                        color: Color.fromRGBO(244, 255, 229, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 55, right: 40, top: 15),
                    alignment: Alignment.topCenter,
                    child: const Center(
                      child: Text(
                        'Overtime Request ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'pop1',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(3, 69, 33, 1)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 17, top: 17),
                    child: const Text(
                      'Notes ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF034521),
                        fontSize: 15,
                        fontFamily: 'pop2',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 17, right: 17, top: 5),
                    child: Form(
                      key: notes,
                      child: TextFormField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 5),
                          filled: true,
                          fillColor: Color.fromRGBO(63, 116, 82, 0.3),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field cannot be empty";
                          }
                        },
                        onSaved: (newValue) => note = newValue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 1),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Add File',
                  style: TextStyle(
                    color: Color(0xFF034521),
                    fontSize: 15,
                    fontFamily: 'pop2',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                child: MaterialButton(
                  onPressed: () {
                    selectFile();
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download_rounded,
                          color: Color(0xff034521),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Choose file",
                          style: TextStyle(
                              color: Color(0xff034521),
                              fontFamily: 'OpenSans',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  color: const Color(0xFFFFC404),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  if (notes.currentState!.validate()) {
                    notes.currentState!.save();
                    if (_file == null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error"),
                          content: Text("Please choose a file."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                      return; // انتهاء الدالة إذا لم يتم اختيار ملف
                    }

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Image.asset(
                                "images/successfully.png",
                                height: 200,
                                width: 200,
                              ),
                              content: const Text(
                                'Overtime Request sends successfully ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF034521),
                                  fontSize: 16,
                                  fontFamily: 'pop2',
                                  fontWeight: FontWeight.w700,
                                  height: 3,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 2),
                              titlePadding: const EdgeInsets.only(top: 10),
                              backgroundColor:
                                  const Color.fromRGBO(244, 255, 229, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ));
                  }
                },
                child: const Text(
                  textAlign: TextAlign.center,
                  'Send',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minWidth: 380,
                height: 53,
                color: const Color(0xFF034521),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 160,
              ),
              Center(
                  child: Image.asset(
                'images/overtime.png',
                height: 260,
                width: 260,
              ))
            ])));
  }
}
