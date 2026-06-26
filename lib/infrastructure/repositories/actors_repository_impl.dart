import 'package:mcvm_movie/domain/domain.dart';
import 'package:mcvm_movie/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  final MoviesDatasource moviesDatasource;

  ActorsRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return moviesDatasource.getMovieCast(movieId);
  }
}
