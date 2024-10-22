import 'package:flutter/material.dart';

import '../customer_details.dart';
import 'customer_info_group.dart';

class CustomerDetailsColumn extends StatelessWidget {
  
  final CustomerDetails customerDetails;

  const CustomerDetailsColumn({
    super.key,
    required this.customerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize      : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        CustomerInfoGroup(
          label: 'E-mail',
          text: customerDetails.email,
        ),
        const SizedBox(height: 30),
        CustomerInfoGroup(
          label: 'Position',
          text: customerDetails.position,
        ),
        const SizedBox(height: 30),
        CustomerInfoGroup(
          label: 'Hobby',
          text: customerDetails.hobby,
        ),
      ],
    );
  }
}