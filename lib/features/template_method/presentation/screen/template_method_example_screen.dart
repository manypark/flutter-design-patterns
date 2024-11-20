import 'package:flutter/material.dart';

import '../widgets/students_section.dart';
import '../widgets/methods/students_xml_bmi_calculator.dart';
import '../widgets/methods/students_json_bmi_calculator.dart';
import '../widgets/methods/teenage_students_json_bmi_calculator.dart';

class TemplateMethodExample extends StatelessWidget {

  static String path = '/template-method-screen';

  const TemplateMethodExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : const SingleChildScrollView(
        padding : EdgeInsets.symmetric( horizontal: 20 ),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            StudentsSection(
              bmiCalculator : StudentsXmlBmiCalculator(),
              headerText    : 'Students from XML data source:',
            ),

            SizedBox(height: 30),

            StudentsSection(
              bmiCalculator : StudentsJsonBmiCalculator(),
              headerText    : 'Students from JSON data source:',
            ),

            SizedBox(height: 30),

            StudentsSection(
              bmiCalculator : TeenageStudentsJsonBmiCalculator(),
              headerText    : 'Students from JSON data source (teenagers only):',
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}