import 'package:hive_flutter/hive_flutter.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel {
  @HiveField(0)
  final String displayName;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final double weight;
  @HiveField(3)
  final double height;
  @HiveField(4)
  final String gender;
  @HiveField(5)
  final String goal;
  @HiveField(6)
  final int enrollDatetime;

  ProfileModel(
      {required this.displayName,
      required this.age,
      required this.weight,
      required this.height,
      required this.gender,
      required this.goal,
      required this.enrollDatetime});
}
