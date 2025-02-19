import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final String name;
  
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  
  final String? biography;
  final String? birthday;
  final String? deathday;
  
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  
  final double popularity;
  
  @JsonKey(name: 'also_known_as')
  final List<String>? alsoKnownAs;
  
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  
  final String? homepage;
  final bool adult;
  
  @JsonKey(name: 'imdb_id')
  final String? imdbId;
  
  @JsonKey(name: 'gender')
  final int? gender;

  Person({
    required this.id,
    required this.name,
    this.profilePath,
    this.biography,
    this.birthday,
    this.deathday,
    this.placeOfBirth,
    required this.popularity,
    this.alsoKnownAs,
    this.knownForDepartment,
    this.homepage,
    required this.adult,
    this.imdbId,
    this.gender,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  // Helper method to get full profile URL
  String? getProfileUrl([String baseUrl = 'https://image.tmdb.org/t/p/w500']) {
    return profilePath != null ? '$baseUrl$profilePath' : null;
  }

  // Helper method to get age
  int? get age {
    if (birthday == null) return null;
    
    try {
      final birthDate = DateTime.parse(birthday!);
      final endDate = deathday != null 
          ? DateTime.parse(deathday!) 
          : DateTime.now();
          
      return endDate.year - birthDate.year - 
        (endDate.month < birthDate.month || 
        (endDate.month == birthDate.month && endDate.day < birthDate.day) ? 1 : 0);
    } catch (e) {
      return null;
    }
  }

  // Helper method to format birthday
  String? get formattedBirthday {
    if (birthday == null) return null;
    try {
      final date = DateTime.parse(birthday!);
      return '${date.month}/${date.day}/${date.year}';
    } catch (e) {
      return null;
    }
  }

  // Helper method to get gender string
  String? get genderString {
    switch (gender) {
      case 1:
        return 'Female';
      case 2:
        return 'Male';
      case 3:
        return 'Non-binary';
      default:
        return null;
    }
  }

  // Helper method to get IMDB URL
  String? get imdbUrl => 
      imdbId != null ? 'https://www.imdb.com/name/$imdbId' : null;

  @override
  String toString() => 'Person(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Person && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}