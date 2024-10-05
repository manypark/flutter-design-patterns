import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carrousel_provider.g.dart';

@riverpod
Future<List<String>> carouselImages(CarouselImagesRef ref) async {

  // Simulamos una llamada de API que puede fallar
  await Future.delayed( const Duration(seconds: 3) );

  // if (!true) { // Cambia a false para probar el éxito
  //   throw Exception('Error loading carousel images');
  // }

  return [
    'https://images3.alphacoders.com/135/1350069.jpeg',
    'https://images7.alphacoders.com/133/1330715.png', 
    'https://img.freepik.com/foto-gratis/pico-montana-nevada-majestuosidad-galaxia-estrellada-ia-generativa_188544-9650.jpg'
  ];
}
