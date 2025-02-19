import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  final String apiUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  Future<List<Movie>> fetchLatestMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/now_playing?api_key=$apiKey&language=en-US&page=1'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
    // This line is technically unreachable, but Dart needs it for null safety
    // ignore: dead_code
    return [];
  }

  
}

// lib/screens/home_screen.dart
