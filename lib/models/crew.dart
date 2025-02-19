class Crew {
  final int id;
  final String creditId;
  final String department;
  final String job;
  final String name;
  final String? profilePath;
  final bool? adult;
  final int? gender;
  final String? knownForDepartment;
  final String? originalName;
  final double? popularity;

  Crew({
    required this.id,
    required this.creditId,
    required this.department,
    required this.job,
    required this.name,
    this.profilePath,
    this.adult,
    this.gender,
    this.knownForDepartment,
    this.originalName,
    this.popularity,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json['id'] as int,
      creditId: json['credit_id'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      originalName: json['original_name'] as String?,
      popularity: json['popularity'] as double?,
    );
  }

  // Helper method to get profile image URL
  String? getProfileUrl([String baseUrl = 'https://image.tmdb.org/t/p/w500']) {
    return profilePath != null ? '$baseUrl$profilePath' : null;
  }
}