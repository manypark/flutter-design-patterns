
import 'package:design_patterns/features/menu/domain/domain.dart';

class MenuState {

  List<MenuEntity> menuList;

  MenuState({
    this.menuList = const [],
  });

  MenuState copyWith({
    List<MenuEntity>? menuList,
  }) {
    return MenuState(
      menuList: menuList ?? this.menuList,
    );
  }
}
