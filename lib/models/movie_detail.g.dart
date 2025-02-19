// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
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
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: (json['runtime'] as num?)?.toInt(),
      status: json['status'] as String?,
      budget: (json['budget'] as num?)?.toInt(),
      revenue: (json['revenue'] as num?)?.toInt(),
      productionCompanies: (json['productionCompanies'] as List<dynamic>)
          .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>)
          .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>)
          .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagline: json['tagline'] as String?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdbId'] as String?,
      inProduction: json['inProduction'] as bool?,
      episodeRunTime: (json['episodeRunTime'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      lastAirDate: json['lastAirDate'] as String?,
      numberOfEpisodes: (json['numberOfEpisodes'] as num?)?.toInt(),
      numberOfSeasons: (json['numberOfSeasons'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
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
      'genres': instance.genres,
      'runtime': instance.runtime,
      'status': instance.status,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'spokenLanguages': instance.spokenLanguages,
      'tagline': instance.tagline,
      'homepage': instance.homepage,
      'imdbId': instance.imdbId,
      'inProduction': instance.inProduction,
      'episodeRunTime': instance.episodeRunTime,
      'lastAirDate': instance.lastAirDate,
      'numberOfEpisodes': instance.numberOfEpisodes,
      'numberOfSeasons': instance.numberOfSeasons,
    };
