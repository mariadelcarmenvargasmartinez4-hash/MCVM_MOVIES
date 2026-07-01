import 'package:mcvm_movie/domain/domain.dart';
import 'package:mcvm_movie/infrastructure/models/moviedb/moviedb_videos_response.dart';

class VideoMapper {
  static Video movieDbVideoToEntity(Result video) => Video(
    id: video.id,
    name: video.name,
    youtubeKey: video.key,
    piblishedAt: video.publishedAt.toIso8601String(),
  );
}