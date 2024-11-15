import 'package:flutter/material.dart';

import '../widgets/order.dart';
import '../widgets/order_item.dart';
import '../widgets/shipping_options.dart';
import '../widgets/order_items_table.dart';
import '../widgets/strategies.dart';
import '../widgets/order_summary/order_summary.dart';
import '../widgets/order_buttons/order_buttons.dart';

class StrategyExampleScreen extends StatefulWidget {

  static String path = '/strategy-example-screen';

  const StrategyExampleScreen({super.key});

  @override
  StrategyExampleState createState() => StrategyExampleState();

}

class StrategyExampleState extends State<StrategyExampleScreen> {
  
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];
  var _selectedStrategyIndex = 0;
  var _order = Order();

  void _addToOrder() => setState(() => _order.addOrderItem(OrderItem.random()));

  void _clearOrder() => setState(() => _order = Order());

  void _setSelectedStrategyIndex(int? index) {
    if (index == null) return;

    setState(() => _selectedStrategyIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OrderButtons(
              onAdd: _addToOrder,
              onClear: _clearOrder,
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 1.0 : 0.0,
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children          : [
                      Text(
                        'Your order is empty',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _order.items.isEmpty ? 0.0 : 1.0,
                  child: Column(
                    children: [
                      OrderItemsTable(
                        orderItems: _order.items,
                      ),
                      const SizedBox(height: 20),
                      ShippingOptions(
                        selectedIndex: _selectedStrategyIndex,
                        shippingOptions: _shippingCostsStrategyList,
                        onChanged: _setSelectedStrategyIndex,
                      ),
                      OrderSummary(
                        shippingCostsStrategy:
                            _shippingCostsStrategyList[_selectedStrategyIndex],
                        order: _order,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}