// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
PaginatedMovieResponse _$PaginatedMovieResponseFromJson(
        Map<String, dynamic> json) =>
    PaginatedMovieResponse(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
      dates: (json['dates'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$PaginatedMovieResponseToJson(
        PaginatedMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'dates': instance.dates,
    };
