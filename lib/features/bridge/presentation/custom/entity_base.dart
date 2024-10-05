import 'package:faker_dart/faker_dart.dart';

abstract class EntityBase {

  static final faker = Faker.instance;

  final String id;

  EntityBase() : id = faker.hashCode.toString();

  EntityBase.fromJson(Map<String, dynamic> json) : id = json['id'] as String;
  
}