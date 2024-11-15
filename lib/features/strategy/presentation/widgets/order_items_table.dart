import 'package:flutter/material.dart';

import 'order_item.dart';

class OrderItemsTable extends StatelessWidget {

  final List<OrderItem> orderItems;

  const OrderItemsTable({
    super.key,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing   : 30,
      horizontalMargin: 20,
      headingRowHeight: 20,
      dataRowMinHeight: 10,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Package Size',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          numeric: true,
        ),
      ],
      rows: <DataRow>[
        for (final orderItem in orderItems)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(orderItem.title)),
              DataCell(Text(orderItem.packageSize.toString().split('.').last)),
              DataCell(Text('\$${orderItem.price.toStringAsFixed(2)}')),
            ],
          ),
      ],
    );
  }
}