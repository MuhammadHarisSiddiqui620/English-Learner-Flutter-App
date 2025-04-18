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

  @HiveField(5)
  String selectedParrot;

  UserModel({
    List<WordModel>? favoritesWord,
    List<WordModel>? showWords,
    List<String>? studyDays,
    List<WordModel>? seenWords,
    String? selectedParrot,
  }) : favoritesWord = favoritesWord ?? [],
       studyDays = studyDays ?? [],
       seenWords = seenWords ?? [],
       showWords = showWords ?? [],
       selectedParrot = selectedParrot ?? 'assets/images/greenParrot.png';
}
