import 'cast.dart';
import 'crew.dart';

class Credits {
  final List<Cast> cast;
  final List<Crew> crew;
  final int? id;  // Movie/TV Show ID these credits belong to

  Credits({
    required this.cast,
    required this.crew,
    this.id,
  });

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      cast: List<Cast>.from(
        (json['cast'] as List? ?? []).map((x) => Cast.fromJson(x as Map<String, dynamic>)),
      ),
      crew: List<Crew>.from(
        (json['crew'] as List? ?? []).map((x) => Crew.fromJson(x as Map<String, dynamic>)),
      ),
      id: json['id'] as int?,
    );
  }

  // Helper method to get cast members sorted by order
  List<Cast> get sortedCast => 
    List<Cast>.from(cast)..sort((a, b) => a.order.compareTo(b.order));

  // Helper method to get crew members by department
  List<Crew> getCrewByDepartment(String department) =>
    crew.where((member) => member.department.toLowerCase() == department.toLowerCase()).toList();
}