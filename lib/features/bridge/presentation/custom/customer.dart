import 'package:faker_dart/faker_dart.dart';

import 'entity_base.dart';

class Customer extends EntityBase {

  static final faker = Faker.instance;

  final String name;
  final String email;

  Customer() :
    name  = faker.name.firstName(),
    email = faker.internet.email();

  Customer.fromJson(super.json)
      : name = json['name'] as String,
        email = json['email'] as String,
        super.fromJson();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}