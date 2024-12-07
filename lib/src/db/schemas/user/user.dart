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

  @HiveField(8)
  String password;

  User({
    this.name = "John Doe",
    this.email = "nothinghere@gmail.com",
    this.gender = 'Male',
    this.age = 10,
    this.mobileNumber = "+213652293781",
    this.weight = 50,
    this.height = 160,
    this.password = "zabunzoPrime"
  })
  : birthDate =  DateTime.now();
}
