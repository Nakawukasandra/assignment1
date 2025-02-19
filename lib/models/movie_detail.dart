import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'movie.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';


part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetail extends Movie {
  final List<Genre> genres;
  final int? runtime;
  final String? status;
  final int? budget;
  final int? revenue;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;
  final String? tagline;
  final String? homepage;
  final String? imdbId;
  final bool? inProduction;
  final List<int>? episodeRunTime;
  final String? lastAirDate;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;

  MovieDetail({
    required super.id,
    required super.title,
    super.originalTitle,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    required super.voteAverage,
    required super.voteCount,
    required super.genre,
    required super.releaseDate,
    required super.genreIds,
    required super.adult,
    required super.popularity,
    required super.originalLanguage,
    required super.video,
    required this.genres,
    this.runtime,
    this.status,
    this.budget,
    this.revenue,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    this.tagline,
    this.homepage,
    this.imdbId,
    this.inProduction,
    this.episodeRunTime,
    this.lastAirDate,
    this.numberOfEpisodes,
    this.numberOfSeasons,
  });

  @override
  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      genre: (json['genres'] as List?)
          ?.map((genre) => (genre as Map<String, dynamic>)['name'] as String)
          .toList() ?? [],
      releaseDate: json['release_date'] as String,
      genreIds: (json['genre_ids'] as List?)?.map((e) => e as int).toList() ?? [],
      adult: json['adult'] as bool,
      popularity: (json['popularity'] as num).toDouble(),
      originalLanguage: json['original_language'] as String,
      video: json['video'] as bool,
      genres: (json['genres'] as List?)
          ?.map((genre) => Genre.fromJson(genre as Map<String, dynamic>))
          .toList() ?? [],
      runtime: json['runtime'] as int?,
      status: json['status'] as String?,
      budget: json['budget'] as int?,
      revenue: json['revenue'] as int?,
      productionCompanies: (json['production_companies'] as List?)
          ?.map((company) => ProductionCompany.fromJson(company as Map<String, dynamic>))
          .toList() ?? [],
      productionCountries: (json['production_countries'] as List?)
          ?.map((country) => ProductionCountry.fromJson(country as Map<String, dynamic>))
          .toList() ?? [],
      spokenLanguages: (json['spoken_languages'] as List?)
          ?.map((language) => SpokenLanguage.fromJson(language as Map<String, dynamic>))
          .toList() ?? [],
      tagline: json['tagline'] as String?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      inProduction: json['in_production'] as bool?,
      episodeRunTime: (json['episode_run_time'] as List?)?.map((e) => e as int).toList(),
      lastAirDate: json['last_air_date'] as String?,
      numberOfEpisodes: json['number_of_episodes'] as int?,
      numberOfSeasons: json['number_of_seasons'] as int?,
    );
  }

  // ignore: annotate_overrides
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  // Helper method to get runtime in hours and minutes
  String? get runtimeFormatted {
    if (runtime == null) return null;
    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;
    return '${hours}h ${minutes}m';
  }

  // Helper method to format budget/revenue
  String formatCurrency(int? amount) {
    if (amount == null) return 'N/A';
    return '\$${(amount/1000000).toStringAsFixed(1)}M';
  }

  String get budgetFormatted => formatCurrency(budget);
  String get revenueFormatted => formatCurrency(revenue);
}