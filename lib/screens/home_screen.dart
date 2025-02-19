// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key, required Null Function() onFinished}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _movieService.fetchLatestMovies();  // Changed to fetchLatestMovies
  }

  Future<void> _refreshMovies() async {
    setState(() {
      _moviesFuture = _movieService.fetchLatestMovies();  // Changed to fetchLatestMovies
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshMovies,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshMovies,
        child: FutureBuilder<List<Movie>>(
          future: _moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshMovies,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No movies available'));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Now Playing',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final movie = snapshot.data![index];
                        return Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  height: 220,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 220,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.error_outline),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, 
                                    size: 16, 
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    movie.voteAverage.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}