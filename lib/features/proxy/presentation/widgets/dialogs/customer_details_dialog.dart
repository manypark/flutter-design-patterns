import 'package:flutter/material.dart';

import '../customer.dart';
import '../customer_details.dart';
import 'customer_details_column.dart';
import '../../../../shared/shared.dart';
import '../interfaces/icustomer_details_service.dart';

class CustomerDetailsDialog extends StatefulWidget {

  const CustomerDetailsDialog({
    super.key,
    required this.customer,
    required this.service,
  });

  final Customer customer;
  final ICustomerDetailsService service;

  @override
  CustomerDetailsDialogState createState() => CustomerDetailsDialogState();
}

class CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service.getCustomerDetails(widget.customer.id).then(
      (CustomerDetails customerDetails) => setState(() {
        widget.customer.details = customerDetails;
      }),
    );
  }

  void _closeDialog() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: SizedBox(
        height: 200.0,
        child: widget.customer.details == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(0.65),
                  ),
                ),
              )
            : CustomerDetailsColumn( customerDetails: widget.customer.details! ),
      ),
      actions:[
        Visibility(
          visible: widget.customer.details != null,
          child: PlatformButton(
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _closeDialog,
            text: 'Close',
          ),
        ),
      ],
    );
  }
}