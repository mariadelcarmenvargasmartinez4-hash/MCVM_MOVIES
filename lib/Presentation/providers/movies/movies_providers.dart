import 'package:flutter_riverpod/legacy.dart';
import 'package:mcvm_movie/domain/domain.dart';
import 'movies_repository_providers.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage=0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    try {
      currentPage++;
      final List<Movie> movies = await fetchMoreMovies(page: currentPage);
      state = [...state, ...movies];
    } catch (_) {
      currentPage = currentPage > 0 ? currentPage - 1 : 0;
      state = state;
    } finally {
      isLoading = false;
    }
  }
  
}