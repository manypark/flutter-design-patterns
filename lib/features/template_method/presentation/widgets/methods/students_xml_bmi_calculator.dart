import 'package:xml/xml.dart';
import 'package:flutter/material.dart';

import '../students_bmi_calculator.dart';
import '../../../domain/entities/student.dart';
import '../../../infrastrcuture/apis/xml_students_api.dart';

class StudentsXmlBmiCalculator extends StudentsBmiCalculator {

  final XmlStudentsApi api;

  const StudentsXmlBmiCalculator({
    this.api = const XmlStudentsApi(),
  });

  @override
  @protected
  List<Student> getStudentsData() {
    final studentsXml = api.getStudentsXml();
    final xmlDocument = XmlDocument.parse(studentsXml);
    final studentsList = <Student>[];

    for (final xmlElement in xmlDocument.findAllElements('student')) {

      final fullName = xmlElement.findElements('fullname').single.innerText;
      final age = int.parse(xmlElement.findElements('age').single.innerText);
      final height = double.parse(xmlElement.findElements('height').single.innerText);
      final weight = int.parse(xmlElement.findElements('weight').single.innerText);

      studentsList.add(
        Student(
          age     : age,
          height  : height,
          weight  : weight,
          fullName: fullName,
        ),
      );
    }

    return studentsList;
  }
}