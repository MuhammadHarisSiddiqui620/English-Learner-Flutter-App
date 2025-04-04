import 'package:hive/hive.dart';

part 'UserModel.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String languageLevel; // e.g., Beginner, Intermediate, Advanced

  @HiveField(3)
  List<String> favorites; // Word IDs or word names

  UserModel({
    required this.username,
    required this.email,
    required this.languageLevel,
    required this.favorites,
  });
}
