import 'package:flutter/material.dart';

import 'team_member.dart';

class NotificationList extends StatelessWidget {

  const NotificationList({
    super.key,
    required this.members,
    required this.onTap,
  });

  final List<TeamMember> members;
  final ValueSetter<TeamMember> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Last notifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Text(
          'Note: click on the card to send a notification from the team member.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        ListView.builder(
          addAutomaticKeepAlives: false,
          physics     : const NeverScrollableScrollPhysics(),
          shrinkWrap  : true,
          itemCount   : members.length,
          itemBuilder : (context, index) {

            final member = members[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: InkWell(
                onTap: () => onTap(member),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              member.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(member.lastNotification ?? '-'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Icon(Icons.message),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}