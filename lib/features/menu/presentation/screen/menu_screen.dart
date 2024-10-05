import 'package:flutter/material.dart';

import '../views/views.dart';

class MenuScreen extends StatelessWidget {

  static String path = '/menu-screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patterns Menu'),
      ),
      body: const MenuView(),
    );
  }
}

