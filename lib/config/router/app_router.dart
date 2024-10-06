import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/prototype/presentation/screen/prototype.dart';
import '../../features/builder/presentation/screen/builder_example.dart';
import '../../features/error_screen/presentation/screen/error_screen.dart';
import 'package:design_patterns/features/factory_method/factory_method.dart';
import 'package:design_patterns/features/menu/presentation/screen/screen.dart';
import '../../features/composite/presentation/screen/composite_example_screen.dart';
import 'package:design_patterns/features/bridge/presentation/screen/bridge_scree.dart';
import 'package:design_patterns/features/abstract_factory/presentation/screen/screen.dart';
import 'package:design_patterns/features/adapter/presentation/screen/adapter_example_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter (AppRouterRef ref) {
  return GoRouter(
    initialLocation     : MenuScreen.path,
    routes              : [

      GoRoute(
        path    : MenuScreen.path,
        builder : (context, state) => const MenuScreen(),
      ),

//////////////////////////////////// || Creational || ////////////////////////////////////
      GoRoute(
        path    : FactoryMethodExample.path,
        builder : (context, state) => const FactoryMethodExample(),
      ),

      GoRoute(
        path    : AbstractFactoryExample.path,
        builder : (context, state) => const AbstractFactoryExample(),
      ),

      GoRoute(
        path    : BuilderExampleScreen.path,
        builder : (context, state) => const BuilderExampleScreen(),
      ),

      GoRoute(
        path    : PrototypeExample.path,
        builder : (context, state) => const PrototypeExample(),
      ),

//////////////////////////////////// || Structural || ////////////////////////////////////


      GoRoute(
        path    : AdapterExample.path,
        builder : (context, state) => const AdapterExample(),
      ),

      GoRoute(
        path    : BridgeExample.path,
        builder : (context, state) => const BridgeExample(),
      ),

      GoRoute(
        path    : CompositeExample.path,
        builder : (context, state) => const CompositeExample(),
      ),

///////////////////////////////////////////////////
      GoRoute(
        path    : ErrorScreen.path,
        builder : (context, state) => const ErrorScreen(),
      ),

    ]
  );
}