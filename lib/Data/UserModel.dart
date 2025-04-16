import 'package:english_learner_flutter_app/Data/WordModel.dart';
import 'package:hive/hive.dart';

part 'UserModel.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  int userLevel = 0;

  @HiveField(1)
  List<WordModel> favoritesWord;

  @HiveField(2)
  List<WordModel> showWords;

  @HiveField(3)
  List<String> studyDays;

  @HiveField(4)
  List<WordModel> seenWords;

  UserModel({
    List<WordModel>? favoritesWord,
    List<WordModel>? showWords,
    List<String>? studyDays,
    List<WordModel>? seenWords,
  }) : favoritesWord = favoritesWord ?? [],
       studyDays = studyDays ?? [],
       seenWords = seenWords ?? [],
       showWords = showWords ?? [];
}
