import 'package:hive/hive.dart';

part 'breakfast.g.dart';

@HiveType(typeId: 2)
class Breakfast {
  @HiveField(0)
  final String foodName;
  @HiveField(1)
  final int protein;
  @HiveField(2)
  final int calorie;
  @HiveField(3)
  final int servings;

  Breakfast(
      {required this.foodName,
      required this.protein,
      required this.calorie,
      required this.servings});
}
