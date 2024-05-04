import 'package:flutter/material.dart';
import 'package:splash_screen/Var.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:splash_screen/profile/home.dart';

class payroll extends StatefulWidget {
  payroll({super.key});

  @override
  State<payroll> createState() => _payrollState();
}

class _payrollState extends State<payroll> {
//  double salary1=salarycal(salaryVar.baseSalary, salaryVar.incentives, salaryVar.deduction);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFF4FFE5),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 18),
                margin: EdgeInsets.zero,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => employeeHomePage()));
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
                padding: EdgeInsets.only(top: 40, left: 95),
                child: Text(
                  "Payroll",
                  style: TextStyle(
                      fontFamily: "pop1",
                      fontSize: 18,
                      color: Color(0xFF034521)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Image(
            image: AssetImage('images/money.png'),
            height: 160,
            width: 160,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 22, right: 22, bottom: 25),
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
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.employeeid}",
                              style: const TextStyle(
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
                        "Employee Name",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Text(
                                "${employeeVar.employeeName}",
                                style: const TextStyle(
                                    fontFamily: "pop2",
                                    fontSize: 11,
                                    color: Color(0xFF034521)),
                              ),
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
                        "Jop Titile",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Text(
                                "${employeeVar.jobTitle}",
                                style: const TextStyle(
                                    fontFamily: "pop2",
                                    fontSize: 11,
                                    color: Color(0xFF034521)),
                              ),
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
                        "Base Salary",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.baseSalary} JOD",
                              style: const TextStyle(
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
                        "Deduction",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.deduction} JOD",
                              style: const TextStyle(
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
                        "Incentives",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.incentives} JOD",
                              style: const TextStyle(
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
                        "Social Security",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.socialSecurity} JOD",
                              style: const TextStyle(
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
                        "Health Insurance",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.healthincurance} JOD",
                              style: const TextStyle(
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
                        "Salary Due",
                        style: TextStyle(
                            fontFamily: "pop2",
                            fontSize: 16,
                            color: Color(0xFF034521)),
                      ),
                      const Spacer(),
                      Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4FFE5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${employeeVar.salary} JOD",
                              style: const TextStyle(
                                  fontFamily: "pop2",
                                  fontSize: 13,
                                  color: Color(0xFF034521)),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF034521),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color(0xFF034521).withOpacity(0.3), // shadow color
                  spreadRadius: 1, // spread radius
                  blurRadius: 3, // blur radius
                  offset: const Offset(0, 3), // only shadow bottom
                ),
              ],
            ),
            child: MaterialButton(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                child: Row(
                  children: [
                    Icon(
                      Icons.print_outlined,
                      color: Color(0xFFFCB721),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 1),
                      child: Text(
                        "Print",
                        style: TextStyle(
                            fontFamily: "pop1",
                            fontSize: 16,
                            color: Color(0xFFFCB721)),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                _createPdf();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfPage(doc: _pdfDocuments1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

double salarycal(
  double baseSalary,
  double incentives,
  double deduction,
) {
  double salary = (baseSalary -
          (employeeVar.healthincurance +
              deduction +
              employeeVar.socialSecurity)) +
      incentives;
  return salary;
}

pw.Document? _pdfDocuments1;

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
              "Employee Payroll",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 25),
            ),
            pw.SizedBox(height: 30),
            pw.Table.fromTextArray(
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.centerLeft,
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
              headerHeight: 45,
              cellHeight: 45,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
              },
              data: <List<dynamic>>[
                [
                  pw.Text('Salary Info', style: pw.TextStyle(fontSize: 20)),
                  pw.Text("Employee Info", style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Employee Name:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text(employeeVar.employeeName,
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Employee ID:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text(employeeVar.employeeid.toString(),
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Job Title:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text(employeeVar.jobTitle,
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Base Salary:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.baseSalary} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Deductions:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.deduction} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Incentives:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.incentives} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Social Security:',
                      style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.socialSecurity} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Health Insurance:',
                      style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.healthincurance} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
                [
                  pw.Text('Salary Due:', style: pw.TextStyle(fontSize: 20)),
                  pw.Text('${employeeVar.salary} JOD',
                      style: pw.TextStyle(fontSize: 20))
                ],
              ],
            ),
          ],
        );
      },
    ),
  );
  _pdfDocuments1 = doc;
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
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (format) => doc!.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}
