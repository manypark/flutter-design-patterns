import '../custom/burger_builder_base.dart';

class BurgerMenuItem {

  const BurgerMenuItem({
    required this.label,
    required this.burgerBuilder,
  });

  final String label;
  final BurgerBuilderBase burgerBuilder;
  
}