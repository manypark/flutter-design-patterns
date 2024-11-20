import 'package:flutter/material.dart';
import 'package:design_patterns/features/shared/shared.dart';

import 'students_data_table.dart';
import 'students_bmi_calculator.dart';
import '../../domain/entities/student.dart';

class StudentsSection extends StatefulWidget {

  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection({
    super.key,
    required this.bmiCalculator,
    required this.headerText,
  });

  @override
  StudentsSectionState createState() => StudentsSectionState();
}

class StudentsSectionState extends State<StudentsSection> {

  final List<Student> students = [];

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        Text(widget.headerText),
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _StudentsSectionContent(
            students: students,
            onPressed: _calculateBmiAndGetStudentsData,
          ),
        ),
      ],
    );
  }
}

class _StudentsSectionContent extends StatelessWidget {

  final List<Student> students;
  final VoidCallback onPressed;

  const _StudentsSectionContent({
    required this.students,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return students.isEmpty
    ? PlatformButton(
        materialColor: Colors.black,
        materialTextColor: Colors.white,
        onPressed: onPressed,
        text: "Calculate BMI and get students' data",
      )
    : StudentsDataTable( students:students );
  }
}