import '../order.dart';
import '../ishipping_costs_strategy.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {

  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) => 9.99;

}
