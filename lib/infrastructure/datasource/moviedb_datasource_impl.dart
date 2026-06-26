import 'package:mcvm_movie/config/config.dart';
import 'package:mcvm_movie/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:mcvm_movie/infrastructure/mappers/movie_mapper.dart';
import 'package:mcvm_movie/infrastructure/mappers/actor_mapper.dart';
import 'package:mcvm_movie/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:mcvm_movie/infrastructure/models/moviedb/moviedb_detail.dart';
import 'package:mcvm_movie/infrastructure/models/moviedb/moviedb_credits.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: Enviroment.apiUrl,
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': Enviroment.language,
    }
  ));

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id $id not found');
    }
    final detail = MovieDbDetail.fromJson(response.data);
    final movie = MovieMapper.movieDetailToEntity(detail);
    return movie;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page,
      });
    
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }

  @override
  Future<List<Actor>> getMovieCast(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final movieCredits = MovieDbCredits.fromJson(response.data);
    final actors = movieCredits.cast
      .map((cast) => ActorMapper.castToEntity(cast))
      .toList();
    return actors;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular',
      queryParameters: {
        'page': page,
      });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/similar');
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page,
      });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getYoutubeVideoById(String movieId) async {
    final response = await dio.get('/movie/$movieId');
    final detail = MovieDbDetail.fromJson(response.data);
    final movie = MovieMapper.movieDetailToEntity(detail);
    return [movie];
  }

  @override
  Future<List<Movie>> searchMovie(String query) async {
    final response = await dio.get('/search/movie',
      queryParameters: {
        'query': query,
      });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page,
      });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final movies = movieDbResponse.results
      .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    return movies;
  }
}