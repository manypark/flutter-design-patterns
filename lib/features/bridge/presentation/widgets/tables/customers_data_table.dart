import 'package:flutter/material.dart';

import '../../custom/customer.dart';


class CustomersDatatable extends StatelessWidget {
  
  final List<Customer> customers;

  const CustomersDatatable({
    super.key, 
    required this.customers,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing   : 20,
        horizontalMargin: 20,
        headingRowHeight: 20,
        dataRowMinHeight: 20,
        columns: const [
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              'E-mail',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
        ],
        rows: <DataRow>[
          for (final customer in customers)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(customer.name)),
                DataCell(Text(customer.email)),
              ],
            ),
        ],
      ),
    );
  }
}