import 'package:flutter/material.dart';

import '../utils/json_contacts_adapter.dart';
import '../utils/xml_contacts_adapter.dart';
import '../views/contacts_section_view.dart';

class AdapterExample extends StatelessWidget {

  static String path = '/adapter-example-screen';

  const AdapterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : const SingleChildScrollView(
        padding : EdgeInsets.symmetric( horizontal: 40 ),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            ContactsSection(
              adapter: JsonContactsAdapter(),
              headerText: 'Contacts from JSON API:',
            ),
      
            SizedBox(height: 30),
      
            ContactsSection(
              adapter: XmlContactsAdapter(),
              headerText: 'Contacts from XML API:',
            ),
      
          ],
        ),
      ),
    );
  }
}
