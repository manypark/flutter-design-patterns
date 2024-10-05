import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../bridge/presentation/screen/bridge_scree.dart';
import '../../../../adapter/presentation/screen/adapter_example_screen.dart';

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
                onTap   : () {},
              ),

              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Decorator'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Facade'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Flyweight'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Proxy'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
            ],
          ),
        ],
      ),
    );
  }
}
