import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

import 'entity_base.dart';

class Order extends EntityBase {

  static final faker = Faker.instance;
  static final random = Random();

  final List<String> dishes;
  final double total;

  Order() :
    dishes = List.generate( random.nextInt(3), (_) => faker.company.bs(), ),
    total  = random.nextDouble() * 50.0;

  Order.fromJson(super.json)
      : dishes = List.from(json['dishes'] as List),
        total = json['total'] as double,
        super.fromJson();

  Map<String, dynamic> toJson() => {
    'id': id,
    'dishes': dishes,
    'total': total,
  };
}