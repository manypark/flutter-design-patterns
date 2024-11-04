import 'dart:async';
import 'package:flutter/material.dart';
import 'package:faker_dart/faker_dart.dart';

import 'stock.dart';

abstract class StockSubscriber {
  
  late final String title;
  static final faker = Faker.instance;

  final id = faker.phoneNumber.phoneNumber();

  @protected
  final StreamController<Stock> stockStreamController = StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  void update(Stock stock);

}
