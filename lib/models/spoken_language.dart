import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: 'iso_639_1') // Ensures correct key mapping
  final String iso6391;
  final String name;
  
  @JsonKey(name: 'english_name')
  final String? englishName;

  SpokenLanguage({
    required this.iso6391,
    required this.name,
    this.englishName,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
