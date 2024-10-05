import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'string_provider.g.dart';

@riverpod
Future<List<String>> stringData(StringDataRef ref) async {

  // Simulamos una llamada de API que puede fallar
  await Future.delayed( const Duration(seconds: 2) );
  
  // Aquí podrías manejar el error
  // if (!true) {
  //   throw Exception('Error loading string data');
  // }

  return ['Data 1', 'Data 2'];
}
