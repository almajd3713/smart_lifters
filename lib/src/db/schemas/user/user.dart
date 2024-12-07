import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;
  // types: exercise, info, etc

  @HiveField(2)
  final String mobileNumber;

  @HiveField(3)
  final DateTime birthDate;

  @HiveField(4)
  final int weight;

  @HiveField(5)
  final double height;

  User({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.birthDate,
    required this.weight,
    required this.height
  });
}
