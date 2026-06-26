import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/infrastructure/infrastructure.dart';
import 'package:mcvm_movie/infrastructure/repositories/actors_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(MoviedbDatasourceImpl());
});
