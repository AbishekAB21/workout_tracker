
import 'package:hive_flutter/hive_flutter.dart';

part 'water.g.dart';

@HiveType(typeId: 9)
class Water{
  
  @HiveField(0)
  late double waterPercent;

  Water({required this.waterPercent});
}