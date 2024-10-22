import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../bridge/presentation/screen/bridge_scree.dart';
import '../../../../decorator/screens/decorator_example_screen.dart';
import '../../../../proxy/presentation/screen/proxy_example_screen.dart';
import '../../../../facade/presentation/screens/facade_example_screen.dart';
import '../../../../adapter/presentation/screen/adapter_example_screen.dart';
import '../../../../composite/presentation/screen/composite_example_screen.dart';
import '../../../../flyweight/presentation/screen/flyweight_example_screen.dart';

class StructurallListView extends StatelessWidget {

  const StructurallListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
          
              ListTile(
                title   : const Text('Adapter'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( AdapterExample.path ),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
          
              ListTile(
                title   : const Text('Bridge'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( BridgeExample.path ),
              ),

              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Composite'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( CompositeExample.path ),
              ),

              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Decorator'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( DecoratorExampleScreen.path ),
                // DecoratorExampleScreen
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Facade'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(FacadeExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Flyweight'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( FlyweightExample.path ),
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Proxy'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push( ProxyExampleScreen.path ),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
            ],
          ),
        ],
      ),
    );
  }
}
