import 'package:hive_flutter/hive_flutter.dart';

part 'dinner.g.dart';

@HiveType(typeId: 4)
class Dinner {
  @HiveField(0)
  final String foodName;
  @HiveField(1)
  final int protein;
  @HiveField(2)
  final int calorie;
  @HiveField(3)
  final int servings;

  Dinner(
      {required this.foodName,
      required this.protein,
      required this.calorie,
      required this.servings});
}
