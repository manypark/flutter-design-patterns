import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../state/presentation/screen/state_example_screen.dart';
import '../../../../memento/presentation/screen/memento_example_screen.dart';
import '../../../../visitor/presentation/screen/visitor_example_screen.dart';
import '../../../../iterator/presentation/screen/iterator_example_screen.dart';
import '../../../../mediator/presentation/screen/mediator_example_screen.dart';
import '../../../../template_method/presentation/screen/template_method_example_screen.dart';
import 'package:design_patterns/features/command/presentation/screen/command_example_screen.dart';
import 'package:design_patterns/features/observer/presentation/screen/observer_example_screen.dart';
import 'package:design_patterns/features/strategy/presentation/screen/strategy_example_screen.dart';
import '../../../../chain_of_responsibility/presentation/screen/chain_of_responsibility_example_screen.dart';

class BehaviorListView extends StatelessWidget {

  const BehaviorListView({ super.key });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
          
              ListTile(
                title   : const Text('Chain of Responsibility'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(ChainOfResponsibilityExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
          
              ListTile(
                title   : const Text('Command'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(CommandExampleScreen.path),
              ),
    
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Interpreter'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
    
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Iterator'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(IteratorExampleScreen.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Mediator'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(MediatorExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Memento'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(MementoExampleScreen.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Observer'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(ObserverExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('State'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(StateExampleScreen.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Strategy'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(StrategyExampleScreen.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Template Method'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(TemplateMethodExample.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Visitor'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () => context.push(VisitorExampleScreen.path),
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
            ],
          ),
        ],
      ),
    );
  }
}
