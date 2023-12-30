import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_tracker/models/food.dart';

part 'meals.g.dart';


@HiveType(typeId: 2)
class Meals {
  @HiveField(0)
  String name;
  @HiveField(1)
  final List<Food> food;

  Meals({required this.name, required this.food});
}
