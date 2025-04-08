import 'package:english_learner_flutter_app/Data/WordModel.dart';
import 'package:hive/hive.dart';

part 'UserModel.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  int userLevel;

  @HiveField(1)
  List<WordModel> favoritesWord;

  @HiveField(2)
  List<WordModel> seenWords;

  UserModel({
    this.userLevel = 0,
    List<WordModel>? favoritesWord,
    List<WordModel>? seenWords,
  }) : favoritesWord = favoritesWord ?? [],
       seenWords = seenWords ?? [];
}
