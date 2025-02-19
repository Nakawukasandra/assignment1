import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';

part 'paginated_movie_response.g.dart';

@JsonSerializable()
class PaginatedMovieResponse {
  final int page;
  final List<Movie> results;
  
  @JsonKey(name: 'total_pages')
  final int totalPages;
  
  @JsonKey(name: 'total_results')
  final int totalResults;
  
  @JsonKey(name: 'dates')
  final Map<String, String>? dates;

  PaginatedMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    this.dates,
  });

  factory PaginatedMovieResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedMovieResponse(
      page: json['page'] as int,
      results: (json['results'] as List?)
          ?.map((movieJson) => Movie.fromJson(movieJson as Map<String, dynamic>))
          .toList() ?? [],
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      dates: (json['dates'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, value as String),
      ),
    );
  }

  Map<String, dynamic> toJson() => _$PaginatedMovieResponseToJson(this);

  // Helper method to check if there's a next page
  bool get hasNextPage => page < totalPages;

  // Helper method to check if there's a previous page
  bool get hasPreviousPage => page > 1;

  // Helper method to get the next page number
  int? get nextPage => hasNextPage ? page + 1 : null;

  // Helper method to get the previous page number
  int? get previousPage => hasPreviousPage ? page - 1 : null;

  // Helper method to get the date range for now playing/upcoming movies
  DateTime? get minimumDate => dates?['minimum'] != null 
      ? DateTime.parse(dates!['minimum']!) 
      : null;

  DateTime? get maximumDate => dates?['maximum'] != null 
      ? DateTime.parse(dates!['maximum']!) 
      : null;

  @override
  String toString() {
    return 'PaginatedMovieResponse(page: $page, totalPages: $totalPages, resultsCount: ${results.length})';
  }
}