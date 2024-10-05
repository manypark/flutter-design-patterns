import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:design_patterns/features/menu/presentation/providers/providers.dart';

class ToggleButtonNavigationBar extends ConsumerWidget {

  const ToggleButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final menuState = ref.watch(menuProvider);

    return ToggleButtons(
      onPressed: (int index) {
          ref.read(menuProvider.notifier).selectedIndex( index );
      },
      borderRadius        : const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor : Colors.black,
      selectedColor       : Colors.white,
      fillColor           : Colors.black38,
      color               : Colors.black,
      constraints: BoxConstraints(
        minHeight : 40.0,
        minWidth  : ( MediaQuery.sizeOf(context).width * 0.3 ),
      ),
      isSelected          : menuState.menuList.map((e) => e.position).toList(),
      children            : menuState.menuList.map((e) => e.text).toList(),
    );
  }
}
