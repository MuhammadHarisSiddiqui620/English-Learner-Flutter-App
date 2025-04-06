import 'package:english_learner_flutter_app/Data/WordModel.dart';
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
  List<WordModel> favoritesWord; // Word IDs or word names

  @HiveField(4)
  List<WordModel> seenWords; // Word IDs or word names

  UserModel({
    required this.username,
    required this.email,
    required this.languageLevel,
    required this.favoritesWord,
    required this.seenWords,
  });
}
