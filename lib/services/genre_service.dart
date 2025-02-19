// lib/services/genre_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genre.dart';

class GenreService {
  final String apiUrl = "https://api.themoviedb.org/3/genre/movie/list";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  Future<List<Genre>> fetchGenres() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));
      if (response.statusCode == 200) {
        final List<dynamic> genreJson = json.decode(response.body)['genres'];
        return genreJson.map((json) => Genre.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load genres: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching genres: $e');
      return [];
    }
  }
}

// Main function to run independently
void main() async {
  GenreService genreService = GenreService();

  // ignore: avoid_print
  print('Fetching genres...');

  try {
    final genres = await genreService.fetchGenres();
    if (genres.isNotEmpty) {
      // ignore: avoid_print
      print('Genres fetched successfully:');
      for (var genre in genres) {
        // ignore: avoid_print
        print('Genre: ${genre.name}');
      }
    } else {
      // ignore: avoid_print
      print('No genres found.');
    }
  } catch (e) {
    // ignore: avoid_print
    print('An error occurred: $e');
  }
}
