import 'dart:math';
import 'package:flutter/material.dart';

import '../../domain/entities/student.dart';

abstract class StudentsBmiCalculator {

  const StudentsBmiCalculator();

  List<Student> calculateBmiAndReturnStudentList() {
    List<Student> studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  void _calculateStudentsBmi(List<Student> studentList) {
    for (final student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / pow(height, 2);
  }

  // Hook methods
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  // Abstract methods
  @protected
  List<Student> getStudentsData();
  
}