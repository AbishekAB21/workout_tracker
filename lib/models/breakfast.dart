import 'package:hive/hive.dart';

part 'breakfast.g.dart';

@HiveType(typeId: 2)
class Breakfast {
  @HiveField(0)
  late String foodName;
  @HiveField(1)
  late int protein;
  @HiveField(2)
  late int calorie;
  @HiveField(3)
  late int servings;

  Breakfast(
      {required this.foodName,
      required this.protein,
      required this.calorie,
      required this.servings});
}
