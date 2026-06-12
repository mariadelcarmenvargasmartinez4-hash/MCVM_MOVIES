import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/infrastructure/infrastructure.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDatasourceImpl() );
});