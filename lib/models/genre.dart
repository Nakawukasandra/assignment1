import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  String toString() => 'Genre(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Genre && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}