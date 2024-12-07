import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String type;
  // types: exercise, info, etc

  @HiveField(2)
  final String description;

  @HiveField(3)
  final ExerciseProps exerciseProps;

  Post({
    required this.name,
    required this.type,
    this.description = '',
  })
  : exerciseProps = ExerciseProps();
}

class ExerciseProps {
  final String time;
  final String calories;

  ExerciseProps({this.time = '', this.calories = ''});
}