// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      iso31661: json['iso_3166_1'] as String,
      rating: json['rating'] as String,
      meaning: json['meaning'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'rating': instance.rating,
      'meaning': instance.meaning,
      'order': instance.order,
    };
