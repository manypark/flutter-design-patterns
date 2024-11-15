import '../order.dart';
import '../order_item.dart';
import '../order_item_enum.dart';
import '../ishipping_costs_strategy.dart';

class ParcelTerminalShippingStrategy implements IShippingCostsStrategy {

  @override
  String label = 'Parcel terminal shipping';

  @override
  double calculate(Order order) => order.items.fold<double>(
    0.0,
    (sum, item) => sum + _getOrderItemShippingPrice(item),
  );

  double _getOrderItemShippingPrice(OrderItem orderItem) =>
    switch (orderItem.packageSize) {
      PackageSize.S => 1.99,
      PackageSize.M => 2.49,
      PackageSize.L => 2.99,
      PackageSize.XL => 3.49,
    };

}