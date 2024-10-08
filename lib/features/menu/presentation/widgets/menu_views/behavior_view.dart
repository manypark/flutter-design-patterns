import 'package:flutter/material.dart';

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
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
          
              ListTile(
                title   : const Text('Command'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
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
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Mediator'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Memento'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Observer'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('State'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Strategy'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Template Method'),
                trailing: const Icon( Icons.arrow_forward_ios_rounded ),
                onTap   : () {},
              ),
          
              const Divider(height: 1, thickness: 0.5,),
    
              ListTile(
                title   : const Text('Visitor'),
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
