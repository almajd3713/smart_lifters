part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserData extends UserState {
  final String name;
  final String email;
  final String gender;
  final String mobileNumber;
  final String birthDate;
  final double weight;
  final double height;
  final int age;
  final String password;

  UserData({
    this.name = '',
    this.email = '',
    this.gender = 'Male',
    this.mobileNumber = '0',
    this.birthDate = '',
    this.weight = 0,
    this.height = 0,
    this.age = 0,
    this.password = ''
  });

  UserData copyWith({
    String? name,
    String? email,
    String? gender,
    String? mobileNumber,
    String? birthDate,
    double? weight,
    double? height,
    int? age,
    String? password,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      password: password ?? this.password,
    );
  }
}
