
import 'package:flutter/material.dart';

abstract class Ingredient {

  @protected
  late List<String> allergens;
  
  @protected
  late String name;

  List<String> getAllergens() => allergens;

  String getName() => name;
}