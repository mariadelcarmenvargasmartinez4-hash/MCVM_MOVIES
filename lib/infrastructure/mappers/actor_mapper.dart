import 'package:mcvm_movie/domain/domain.dart';
import 'package:mcvm_movie/infrastructure/infrastructure.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    final profilePath = (cast.profilePath ?? '').trim();

    return Actor(
      id: cast.id,
      name: cast.name.isEmpty ? 'Actor desconocido' : cast.name,
      profilePath: profilePath.isEmpty
          ? 'https://placehold.co/300x450/png/1f1f1f/FFFFFF?text=Sin+foto'
          : 'https://image.tmdb.org/t/p/w500$profilePath',
      character: cast.character.isEmpty ? 'Sin personaje' : cast.character,
    );
  }
}