import 'package:flutter/material.dart';
import 'package:splash_screen/employee_features/emp_document.dart';
import 'package:splash_screen/variable.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class warningEmp extends StatefulWidget {
  const warningEmp({super.key});

  @override
  State<warningEmp> createState() => _receivedState();
}

class _receivedState extends State<warningEmp> {
  static String HRname = "Hala Issa";
  static String HRjobtitle = "HR Manager";
  static String Wartyp = "Warning for Disrespectful Behavior";

  static List<Widget> widgets = [
    warWidget(
      HRname: HRname,
      HRjobtitle: HRjobtitle,
      Wartyp: Wartyp,
      imagePath: 'images/hala.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4FFE5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 13),
                  margin: EdgeInsets.zero,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EmployeeDocument(),
                        ),
                      );
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
                  padding: EdgeInsets.only(top: 40, left: 90),
                  child: Text(
                    "Warning",
                    style: TextStyle(
                        fontFamily: "pop1",
                        fontSize: 16,
                        color: Color(0xFF034521)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: widgets,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 10,
                ),
                Positioned(
                  top: 302,
                  left: -120,
                  child: Image(
                    image: AssetImage(
                      'images/warning.png',
                    ),
                    height: 280,
                    width: 280,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class warWidget extends StatefulWidget {
  final String HRname;
  final String HRjobtitle;
  final String Wartyp;
  final String imagePath;
  @override
  State<warWidget> createState() => _warWidgetState();

  const warWidget({
    Key? key,
    required this.HRname,
    required this.HRjobtitle,
    required this.Wartyp,
    required this.imagePath,
  }) : super(key: key);
}

class _warWidgetState extends State<warWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC404).withOpacity(0.8),
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
      margin: const EdgeInsets.only(top: 19, left: 15, right: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: ClipOval(
                  child: Image.asset(
                    widget.imagePath,
                    width: 55, // Specify the desired width
                    height:
                        55, // Specify the desired height to maintain aspect ratio
                    fit: BoxFit
                        .cover, // This ensures the image fills the circular area
                  ),
                  // Specify the desired height
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      widget.HRname,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: "pop2",
                          fontSize: 15,
                          color: Color(0xFF034521)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.HRjobtitle,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: "pop2",
                          fontSize: 15,
                          color: Color(0xFF034521)),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 38),
            child: Text(
              widget.Wartyp,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontFamily: "Open2", fontSize: 15, color: Color(0xFF034521)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 200, right: 0),
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF034521),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // shadow color
                  spreadRadius: 2, // spread radius
                  blurRadius: 3, // blur radius
                  offset: const Offset(0, 3), // only shadow bottom
                ),
              ],
            ),
            child: MaterialButton(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                child: Center(
                  child: Text(
                    "View",
                    style: TextStyle(
                        fontFamily: "pop1",
                        fontSize: 15,
                        color: Color(0xFFFCB721)),
                  ),
                ),
              ),
              onPressed: () {
                _createPdf(); // Call the function to generate the PDF document
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPage(doc: _pdfDocumentw1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

pw.Document? _pdfDocumentw1;

void _createPdf() {
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Warning",
              style: pw.TextStyle(fontSize: 35, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              "Employee Information:",
              style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold),
            ),
            pw.Text("Name: ${employee.name}",
                style: const pw.TextStyle(fontSize: 18)),
            pw.Text("Position: ${employee.jobTitle}",
                style: const pw.TextStyle(fontSize: 18)),
            pw.Text("Start Date: ${employee.getFormattedCurrentMonth()}",
                style: const pw.TextStyle(fontSize: 18)),
            pw.Text("Expiry Date: 20/6/2024",
                style: const pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 20),
            pw.Text(
              "Warning for Disrespectful Behavior",
              style: pw.TextStyle(fontSize: 25, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              "Dear ${employee.name},",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "It has come to our notice that you resorted to unprofessional and rude behaviour in the workplace on ${DateTime.now().toString()}.",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "We would like to inform you that this behavior is unacceptable as per our company policy. Further, this behavior is also considered as misconduct on your part which is a violation of our ethical code of conduct.",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "Your manager has already discussed with you verbally on this matter. We are sending this official written warning to you. If we see any other instance of disrespectful behavior in future, you will be subject to disciplinary action as per company policy.",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "We recommend you treat this matter with utmost importance and seriousness. You are advised to change your behavior at the earliest. Note that a copy of this letter is attached in your employment record.",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              "Let me know if you have any questions.",
              style: const pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              "Sincerely,",
              style: const pw.TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    ),
  );
  _pdfDocumentw1 = doc;
}

class PdfPage extends StatelessWidget {
  final pw.Document? doc;

  const PdfPage({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (format) => doc!.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "employee_warning.pdf",
      ),
    );
  }
}
