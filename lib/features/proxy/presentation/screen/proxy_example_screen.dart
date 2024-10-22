
import 'package:flutter/material.dart';

import '../widgets/customer.dart';
import '../widgets/customer_details_service.dart';
import '../widgets/customer_details_service_proxy.dart';
import '../widgets/dialogs/customer_details_dialog.dart';

class ProxyExampleScreen extends StatefulWidget {

  static String path = '/proxy-example-screen';

  const ProxyExampleScreen({super.key});

  @override
  ProxyExampleState createState() => ProxyExampleState();
}

class ProxyExampleState extends State<ProxyExampleScreen> {
  
  final _customerDetailsServiceProxy = CustomerDetailsServiceProxy( const CustomerDetailsService() );

  final _customerList = List.generate(10, (_) => Customer());

  void _showCustomerDetails(Customer customer) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => CustomerDetailsDialog(
          service : _customerDetailsServiceProxy,
          customer: customer,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding : const EdgeInsets.symmetric( horizontal:30 ),
        child   : Column(
          children: [

            Text(
              'Press on the list tile to see more information about the customer',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height:30),

            for (var customer in _customerList)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      customer.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: const Icon(Icons.info_outline),
                  title: Text(customer.name),
                  onTap: () => _showCustomerDetails(customer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}