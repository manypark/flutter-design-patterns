import 'package:flutter/material.dart';

import '../custom/custom.dart';
import '../widgets/widgets.dart';
import 'package:design_patterns/features/shared/shared.dart';

class FactoryMethodExample extends StatefulWidget {

  static String path = '/factory-method-screen';

  const FactoryMethodExample({super.key});

  @override
  FactoryMethodExampleState createState() => FactoryMethodExampleState();
}

class FactoryMethodExampleState extends State<FactoryMethodExample> {
  
  final List<CustomDialog> customDialogList = const [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  var _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    final selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int? index) {
    if (index == null) return;

    setState(() => _selectedDialogIndex = index);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

              DialogSelection(
                customDialogList: customDialogList,
                selectedIndex   : _selectedDialogIndex,
                onChanged       : _setSelectedDialogIndex,
              ),

              const SizedBox(height: 20),

              PlatformButton(
                materialColor     : Colors.black,
                materialTextColor : Colors.white,
                onPressed         : () => _showCustomDialog(context),
                text              : 'Show Dialog',
              ),
            ],
          ),
        ),
      ),
    );

  }

}
