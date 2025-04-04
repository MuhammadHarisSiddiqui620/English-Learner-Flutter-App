import 'package:hive/hive.dart';

part 'WordModel.g.dart';

@HiveType(typeId: 0)
class WordModel extends HiveObject {
  @HiveField(0)
  String word;

  @HiveField(1)
  String noun;

  @HiveField(2)
  String adjective;

  @HiveField(3)
  String verb;

  @HiveField(4)
  String description;

  WordModel({
    required this.word,
    required this.noun,
    required this.adjective,
    required this.verb,
    required this.description,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] ?? '',
      noun: json['noun'] ?? '',
      adjective: json['adjective'] ?? '',
      verb: json['verb'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
