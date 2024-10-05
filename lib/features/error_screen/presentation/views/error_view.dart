
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';
import '../providers/string_provider.dart';
import '../providers/carrousel_provider.dart';

class ErrorView extends ConsumerWidget {
  
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final stringData      = ref.watch(stringDataProvider);
    final carouselImages  = ref.watch(carouselImagesProvider);

    if ( stringData.isLoading || carouselImages.isLoading ) {
      return const Center( child: CircularProgressIndicator() );
    }

    if (stringData.hasError || carouselImages.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children          : [

            const Text(
              'An error occurred while loading data.',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                // Reintentamos cargar los datos de ambos providers

                // ignore: unused_result
                ref.refresh(stringDataProvider);

                // ignore: unused_result
                ref.refresh(carouselImagesProvider);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    
    return Column(
      children: [
        StringWidget(data: stringData.value!), // Pasamos los datos de string
        CarouselWidget(images: carouselImages.value!), // Pasamos las imágenes
      ],
    );
  }
}