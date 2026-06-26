import 'package:mcvm_movie/domain/entities/movie.dart';
import 'package:mcvm_movie/domain/entities/actor.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String id);
  Future<List<Movie>> searchMovie(String query);
  Future<List<Movie>> getSimilarMovie(String movieId);
  Future<List<Movie>> getYoutubeVideoById(String movieId);
  Future<List<Actor>> getMovieCast(String movieId);
}
