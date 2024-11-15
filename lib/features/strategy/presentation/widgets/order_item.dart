import 'dart:math';

import 'package:faker_dart/faker_dart.dart';

import 'order_item_enum.dart';

class OrderItem {

  final String title;
  final double price;
  final PackageSize packageSize;
  static final faker = Faker.instance;
  
  const OrderItem({
    required this.title,
    required this.price,
    required this.packageSize,
  });

  factory OrderItem.random() {
    const packageSizeList = PackageSize.values;

    return OrderItem(
      title: faker.lorem.word(),
      price: (Random().nextInt(100) + 5) - 0.01,
      packageSize: packageSizeList[Random().nextInt(packageSizeList.length)],
    );
  }
}