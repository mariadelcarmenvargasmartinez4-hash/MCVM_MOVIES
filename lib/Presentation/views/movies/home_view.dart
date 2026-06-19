
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/Presentation/providers/providers.dart';
import 'package:mcvm_movie/Presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final movies = ref.read(nowPlayingMoviesProvider);
      if (movies.isEmpty) {
        ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(nowPlayingMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: const CustomAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: movies.isEmpty
              ? const SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    MoviesSlideshow(movies: movies),
                    const SizedBox(height: 16),
                    MovieHorizontalListview(
                      movies: movies,
                      title: 'En cartelera',
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}