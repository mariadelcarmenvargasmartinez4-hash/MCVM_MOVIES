import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/Presentation/providers/providers.dart';
import 'package:mcvm_movie/Presentation/widgets/movies/movie_masonry.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  ConsumerState<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends ConsumerState<PopularView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final movies = ref.read(popularMoviesProvider);
      if (movies.isEmpty) {
        ref.read(popularMoviesProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(popularMoviesProvider);

    if (movies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return MovieMasonry(
      movie: movies,
      loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
    );
  }
}