import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker_dart/faker_dart.dart';

import '../widgets/team_member.dart';
import '../widgets/notification_hub.dart';
import '../widgets/notification_list.dart';
import '../widgets/team_notification_hub.dart';
import '../widgets/member_class/members_class.dart';
import 'package:design_patterns/features/shared/shared.dart';

class MediatorExample extends StatefulWidget {

  static String path = '/mediator-example-screen';

  const MediatorExample({super.key});

  @override
  MediatorExampleState createState() => MediatorExampleState();
}

class MediatorExampleState extends State<MediatorExample> {
  
  late final NotificationHub _notificationHub;
  final _admin = Admin(name: 'God');
  static final faker = Faker.instance;

  @override
  void initState() {
    super.initState();

    final members = [
      _admin,
      Developer(name: 'Sea Sharp'),
      Developer(name: 'Jan Assembler'),
      Developer(name: 'Dove Dart'),
      Tester(name: 'Cori Debugger'),
      Tester(name: 'Tania Mocha'),
    ];

    _notificationHub = TeamNotificationHub(members: members);
  }

  void _sendToAll() => setState(() => _admin.send('Hello everyone!'));

  void _sendToQa() => setState(() => _admin.sendTo<Tester>('BUG!'));

  void _sendToDevelopers() => setState( () => _admin.sendTo<Developer>('Hello, World!') );

  void _addTeamMember() {

    int rng = Random().nextInt(10);

    final name = '${faker.name.firstName()} ${faker.name.lastName()}';
    
    final teamMember = (rng < 5)
        ? Tester(name: name)
        : Developer(name: name);

    setState(() => _notificationHub.register(teamMember));
  }

  void _sendFromMember(TeamMember member) => setState(
    () => member.send('Hello from ${member.name}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding : const EdgeInsets.symmetric( horizontal:30 ),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children          : [
      
            PlatformButton(
              text              : "Admin: Send 'Hello' to all",
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _sendToAll,
            ),

            PlatformButton(
              text              : "Admin: Send 'BUG!' to QA",
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _sendToQa,
            ),

            PlatformButton(
              text              : "Admin: Send 'Hello, World!' to Developers",
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _sendToDevelopers,
            ),

            const Divider(),

            PlatformButton(
              text              : "Add team member",
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _addTeamMember,
            ),
      
            const SizedBox(height: 30),
            
            NotificationList(
              members : _notificationHub.getTeamMembers(),
              onTap   : _sendFromMember,
            ),
          ],
        ),
      ),
    );
  }
}