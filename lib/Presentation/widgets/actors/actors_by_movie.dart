import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mcvm_movie/Presentation/providers/actors/actors_by_movie_provider.dart';

// Widget that displays a list of actors for a given movie
class ActorsByMovieWidget extends ConsumerWidget {
  final String movieId;

  const ActorsByMovieWidget({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsMap = ref.watch(actorsByMovieProvider);
    final actors = actorsMap[movieId] ?? [];

    if (actors.isEmpty) {
      return const Center(
        child: Text('No hay actores disponibles'),
      );
    }

    return ListView.builder(
      itemCount: actors.length,
      itemBuilder: (context, index) {
        final actor = actors[index];
        return ListTile(
          leading: Image.network(actor.profilePath),
          title: Text(actor.name),
          subtitle: Text(actor.character),
        );
      },
    );
  }
}