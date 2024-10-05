import 'package:flutter/material.dart';

import '../views/error_view.dart';

class ErrorScreen extends StatelessWidget {

  static String path = '/error-screen';

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error screen'),
      ),
      body: const ErrorView(),
    );
  }

}
