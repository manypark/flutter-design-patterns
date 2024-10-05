import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../prototype/presentation/screen/prototype.dart';
import '../../../../factory_method/presentation/screen/screen.dart';
import '../../../../abstract_factory/presentation/screen/screen.dart';
import '../../../../builder/presentation/screen/builder_example.dart';

class CreationalListView extends StatelessWidget {

  const CreationalListView({ super.key });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
          
              ListTile(
                title   : const Text('Factory Method'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(FactoryMethodExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
          
              ListTile(
                title   : const Text('Abstract Factory'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(AbstractFactoryExample.path),
              ),

              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Builder'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(BuilderExampleScreen.path),
              ),

              const Divider(height: 1, thickness: 0.5,),

              ListTile(
                title   : const Text('Prototype'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(PrototypeExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
            ],
          ),
        ],
      ),
    );
  }
}
