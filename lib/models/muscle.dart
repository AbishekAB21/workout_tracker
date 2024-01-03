
import 'package:hive_flutter/hive_flutter.dart';

part 'muscle.g.dart';

@HiveType(typeId: 5)
class Muscle{
  
  @HiveField(0)
  late String muscleName;

  Muscle({required this.muscleName});

}