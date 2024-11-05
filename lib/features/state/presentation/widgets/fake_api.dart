import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

class FakeApi {

  const FakeApi();
  static final faker = Faker.instance;

  Future<List<String>> getNames() => Future.delayed( const Duration(seconds: 2), () {
      if (Random().nextBool()) return _getRandomNames();

      throw Exception('Unexpected error');
    },
  );

  List<String> _getRandomNames() => List.generate( Random().nextBool() ? 3 : 0, (_) => faker.name.fullName() );
}
