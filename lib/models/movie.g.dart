// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
      genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
      releaseDate: json['releaseDate'] as String,
      genreIds: (json['genreIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      adult: json['adult'] as bool,
      popularity: (json['popularity'] as num).toDouble(),
      originalLanguage: json['originalLanguage'] as String,
      video: json['video'] as bool,
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'genre': instance.genre,
      'releaseDate': instance.releaseDate,
      'genreIds': instance.genreIds,
      'adult': instance.adult,
      'popularity': instance.popularity,
      'originalLanguage': instance.originalLanguage,
      'video': instance.video,
      'media_type': instance.mediaType,
    };
