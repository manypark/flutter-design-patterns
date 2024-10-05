
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'menu_provider_state.dart';
import 'package:design_patterns/features/menu/domain/domain.dart';

part 'menu_provider.g.dart';

@Riverpod( keepAlive:true )
class Menu extends _$Menu {

  @override
  MenuState build() => MenuState(
    menuList: [

      MenuEntity(
        index   : 0,
        position: true,
        text    : const Text('Creacional')
      ),

      MenuEntity(
        index   : 1,
        position: false,
        text    : const Text('Estructural')
      ),

      MenuEntity(
        index   : 2,
        position: false,
        text    : const Text('Comportamiento')
      ),

    ]
  );

  void selectedIndex( int value ) {

    final newMenuList = state.menuList.map((e) {
        e.position = false;
        if( e.index == value ) e.position = true;
        return e;
      }).toList();

    state = state.copyWith( menuList:newMenuList );

  }

}
