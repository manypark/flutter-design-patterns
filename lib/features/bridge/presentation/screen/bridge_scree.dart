
import 'package:design_patterns/features/shared/shared.dart';
import 'package:flutter/material.dart';

import '../custom/customer.dart';
import '../custom/customers_repository.dart';
import '../custom/file_storage.dart';
import '../custom/irepository.dart';
import '../custom/order.dart';
import '../custom/orders_repository.dart';
import '../custom/sql_storage.dart';
import '../widgets/storage_selection.dart';
import '../widgets/tables/customers_data_table.dart';
import '../widgets/tables/orders_data_table.dart';

class BridgeExample extends StatefulWidget {

  static String path = '/bridge-screen';

  const BridgeExample({super.key});

  @override
  BridgeExampleState createState() => BridgeExampleState();
}

class BridgeExampleState extends State<BridgeExample> {

  final _storages = [SqlStorage(), FileStorage()];

  late IRepository _customersRepository;
  late IRepository _ordersRepository;

  late List<Customer> _customers;
  late List<Order> _orders;

  var _selectedCustomerStorageIndex = 0;
  var _selectedOrderStorageIndex = 0;

  void _onSelectedCustomerStorageIndexChanged(int? index) {
    if (index == null) return;

    setState(() {
      _selectedCustomerStorageIndex = index;
      _customersRepository = CustomersRepository(_storages[index]);
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _onSelectedOrderStorageIndexChanged(int? index) {
    if (index == null) return;

    setState(() {
      _selectedOrderStorageIndex = index;
      _ordersRepository = OrdersRepository(_storages[index]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _addCustomer() {
    _customersRepository.save(Customer());

    setState(
      () => _customers = _customersRepository.getAll() as List<Customer>,
    );
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() => _orders = _ordersRepository.getAll() as List<Order>);
  }

  @override
  void initState() {

    super.initState();

    _customersRepository = CustomersRepository(_storages[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll() as List<Customer>;

    _ordersRepository = OrdersRepository(_storages[_selectedOrderStorageIndex]);
    _orders = _ordersRepository.getAll() as List<Order>;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Select customers storage:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              StorageSelection(
                storages: _storages,
                selectedIndex: _selectedCustomerStorageIndex,
                onChanged: _onSelectedCustomerStorageIndexChanged,
              ),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _addCustomer,
                text: 'Add',
              ),
              if (_customers.isNotEmpty)
                CustomersDatatable(customers: _customers)
              else
                Text(
                  '0 customers found',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              const Divider(),
              Row(
                children: [
                  Text(
                    'Select orders storage:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              StorageSelection(
                storages: _storages,
                selectedIndex: _selectedOrderStorageIndex,
                onChanged: _onSelectedOrderStorageIndexChanged,
              ),
              PlatformButton(
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _addOrder,
                text: 'Add',
              ),
              if (_orders.isNotEmpty) OrdersDatatable(orders: _orders)
              else
                Text(
                  '0 orders found',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
            ],
          ),
        ),
      ),
    );
  }
}