import 'package:hive_flutter/hive_flutter.dart';

part 'lunch.g.dart';

@HiveType(typeId: 3)
class Lunch {
  @HiveField(0)
  final String foodName;
  @HiveField(1)
  final int protein;
  @HiveField(2)
  final int calorie;
  @HiveField(3)
  final int servings;

  Lunch(
      {required this.foodName,
      required this.protein,
      required this.calorie,
      required this.servings});
}
