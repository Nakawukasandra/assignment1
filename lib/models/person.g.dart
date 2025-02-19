// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      deathday: json['deathday'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      knownForDepartment: json['known_for_department'] as String?,
      homepage: json['homepage'] as String?,
      adult: json['adult'] as bool,
      imdbId: json['imdb_id'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'deathday': instance.deathday,
      'place_of_birth': instance.placeOfBirth,
      'popularity': instance.popularity,
      'also_known_as': instance.alsoKnownAs,
      'known_for_department': instance.knownForDepartment,
      'homepage': instance.homepage,
      'adult': instance.adult,
      'imdb_id': instance.imdbId,
      'gender': instance.gender,
    };
