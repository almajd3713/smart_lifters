import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;
  // types: exercise, info, etc

  @HiveField(2)
  String gender;

  @HiveField(3)
  String mobileNumber;

  @HiveField(4)
  DateTime birthDate;

  @HiveField(5)
  double weight;

  @HiveField(6)
  double height;

  @HiveField(7)
  int age;

  User({
    this.name = "",
    this.email = "",
    this.gender = 'male',
    this.age = 10,
    this.mobileNumber = "",
    this.weight = 50,
    this.height = 160
  })
  : birthDate =  DateTime.now();
}
