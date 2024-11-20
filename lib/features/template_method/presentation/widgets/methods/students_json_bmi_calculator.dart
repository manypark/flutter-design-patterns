import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../infrastrcuture/apis/json_students_api.dart';
import '../students_bmi_calculator.dart';
import '../../../domain/entities/student.dart';

class StudentsJsonBmiCalculator extends StudentsBmiCalculator {

  final JsonStudentsApi api;

  const StudentsJsonBmiCalculator({
    this.api = const JsonStudentsApi(),
  });

  @override
  @protected
  List<Student> getStudentsData() {

    final studentsJson = api.getStudentsJson();
    final studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    final studentsJsonList = studentsMap['students'] as List;
    
    final studentsList = studentsJsonList.map((json) {
      final studentJson = json as Map<String, dynamic>;

      return Student(
        age     : studentJson['age'] as int,
        height  : studentJson['height'] as double,
        weight  : studentJson['weight'] as int,
        fullName: studentJson['fullName'] as String,
      );
    }).toList();

    return studentsList;
  }
}