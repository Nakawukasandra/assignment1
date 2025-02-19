import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final List<String> genre;
  final String releaseDate;
  final List<int> genreIds;
  final bool adult;
  final double popularity;
  final String originalLanguage;
  final bool video;
  
  @JsonKey(name: 'media_type')
  final String? mediaType;

  Movie({
    required this.id,
    required this.title,
    this.originalTitle,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genre,
    required this.releaseDate,
    required this.genreIds,
    required this.adult,
    required this.popularity,
    required this.originalLanguage,
    required this.video,
    this.mediaType,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  // Helper method to get full poster URL
  String? getPosterUrl([String baseUrl = 'https://image.tmdb.org/t/p/w500']) {
    return posterPath != null ? '$baseUrl$posterPath' : null;
  }

  // Helper method to get full backdrop URL
  String? getBackdropUrl([String baseUrl = 'https://image.tmdb.org/t/p/original']) {
    return backdropPath != null ? '$baseUrl$backdropPath' : null;
  }

  // Helper method to format vote average
  String get voteAverageFormatted => voteAverage.toStringAsFixed(1);

  // Helper method to get release year
  String? get releaseYear {
    try {
      return DateTime.parse(releaseDate).year.toString();
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Movie && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}