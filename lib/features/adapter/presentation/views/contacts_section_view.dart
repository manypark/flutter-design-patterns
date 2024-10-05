import 'package:flutter/material.dart';

import '../utils/contact.dart';
import '../widget/contact_card.dart';
import '../utils/icontacts_adapter.dart';
import 'package:design_patterns/features/shared/shared.dart';

class ContactsSection extends StatefulWidget {

  final IContactsAdapter adapter;
  final String headerText;

  const ContactsSection({
    super.key,
    required this.adapter,
    required this.headerText,
  });

  @override
  ContactsSectionState createState() => ContactsSectionState();
}

class ContactsSectionState extends State<ContactsSection> {

  final List<Contact> contacts = [];

  void _getContacts() {
    contacts.addAll(widget.adapter.getContacts());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        Text(widget.headerText),

        const SizedBox(height: 20 ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _ContactsSectionContent(
            contacts  : contacts,
            onPressed : _getContacts,
          ),
        ),
      ],
    );
  }
}

class _ContactsSectionContent extends StatelessWidget {

  final List<Contact> contacts;
  final VoidCallback onPressed;

  const _ContactsSectionContent({
    required this.contacts,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return contacts.isEmpty

    ? PlatformButton(
        materialColor: Colors.black,
        materialTextColor: Colors.white,
        onPressed: onPressed,
        text: 'Get contacts',
      )
    :
    ListView.builder(
      addAutomaticKeepAlives: false,
      shrinkWrap  : true,
      itemCount   : contacts.length,
      itemBuilder : (context, index) {

        final contact = contacts[index];

        return ContactCard(contact: contact);
      },
    );
  }
}