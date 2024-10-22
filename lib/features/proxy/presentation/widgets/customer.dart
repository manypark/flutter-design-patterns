import 'package:faker_dart/faker_dart.dart';

import 'customer_details.dart';

class Customer {

  static final faker = Faker.instance;

  Customer():
    id    = faker.address.latitude().toString(),
    name  = faker.name.firstName();

  final String id;
  final String name;
  CustomerDetails? details;
}