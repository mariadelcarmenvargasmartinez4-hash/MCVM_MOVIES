import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/infrastructure/infrastructure.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(MoviedbDatasourceImpl());
});
