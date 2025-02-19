import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  @JsonKey(name: 'iso_3166_1')  // Ensures correct key mapping
  final String iso31661;
  
  final String rating;
  
  final String? meaning;
  
  final int? order;

  Rating({
    required this.iso31661,
    required this.rating,
    this.meaning,
    this.order,
  });

  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
