class Cast {
  final int id;
  final String name;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;
  final double? popularity;
  final String? knownForDepartment;
  final String? originalName;
  final int? gender;
  final String? department;
  final String? job;

  Cast({
    required this.id,
    required this.name,
    this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
    this.popularity,
    this.knownForDepartment,
    this.originalName,
    this.gender,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      popularity: json['popularity'] as double?,
      knownForDepartment: json['known_for_department'] as String?,
      originalName: json['original_name'] as String?,
      gender: json['gender'] as int?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );
  }
}