import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:design_patterns/features/menu/presentation/widgets/widgets.dart';
import 'package:design_patterns/features/menu/presentation/providers/menu_provider/menu_provider.dart';

const List<Widget> pages = [
  CreationalListView(),
  StructurallListView(),
  BehaviorListView(),
];

class MenuView extends ConsumerWidget {

  const MenuView({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final menuPsitionState = ref.watch(menuProvider);
    final indexState = menuPsitionState.menuList.firstWhere( (menu) => menu.position == true ).index;

    return Stack(
      children: [

        // ...pages.asMap().map((index, page) {
        //   return MapEntry(index, AnimatedOpacity(
        //     duration: const Duration(milliseconds: 300),
        //     opacity : indexState == index ? 1.0 : 0.0,
        //     child   : page,
        //   ));
        // },).values,

        ...pages.asMap().map((index, page) {
          return MapEntry(index, AnimatedPositioned(
            duration: const Duration(milliseconds: 0),
            top     : indexState == index ? 0 : MediaQuery.of(context).size.height,
            left    : 0,
            right   : 0,
            bottom  : 0,
            child   : page,
          ));
        },).values,

        const Align(
          alignment : Alignment.bottomCenter,
          child     : Padding(
            padding : EdgeInsets.only( bottom: 40 ),
            child   : ToggleButtonNavigationBar(),
          )
        ),

      ],
    );
  }
}
