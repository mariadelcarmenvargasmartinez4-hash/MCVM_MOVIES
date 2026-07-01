import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/Presentation/providers/movies/movies_repository_providers.dart';
import 'package:mcvm_movie/domain/domain.dart';

final youtubeVideoProvider = FutureProvider.family<List<Video>, String>(
  (ref, movieId) async {
    final movieRepository = ref.watch(movieRepositoryProvider);
    return movieRepository.getYoutubeVideoById(movieId);
  },
);