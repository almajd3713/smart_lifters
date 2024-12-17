part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserUpdateName extends UserEvent {
  final String name;
  UserUpdateName(this.name);
}

class UserUpdateEmail extends UserEvent {
  final String email;
  UserUpdateEmail(this.email);
}

class UserUpdateGender extends UserEvent {
  final String gender;
  UserUpdateGender(this.gender);
}

class UserUpdateMobileNumber extends UserEvent {
  final String mobileNumber;
  UserUpdateMobileNumber(this.mobileNumber);
}

class UserUpdateBirthDate extends UserEvent {
  final String birthDate;
  UserUpdateBirthDate(this.birthDate);
}

class UserUpdateWeight extends UserEvent {
  final double weight;
  UserUpdateWeight(this.weight);
}

class UserUpdateHeight extends UserEvent {
  final double height;
  UserUpdateHeight(this.height);
}

class UserUpdateAge extends UserEvent {
  final int age;
  UserUpdateAge(this.age);
}

class UserUpdatePassword extends UserEvent {
  final String password;
  UserUpdatePassword(this.password);
}
