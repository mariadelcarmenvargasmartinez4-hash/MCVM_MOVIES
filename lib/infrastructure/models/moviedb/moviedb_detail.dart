class MovieDbDetail {
    final bool adult;
    final String backdropPath;
    final List<String> genreIds;
    final int id;
    final String title;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final DateTime releaseDate;
    final bool softcore;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieDbDetail({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.title,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.softcore,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDbDetail.fromJson(Map<String, dynamic> json) {
      final genres = json['genres'] as List<dynamic>?;
      final parsedGenres = genres
          ?.map((genre) => genre is Map ? genre['name']?.toString() ?? '' : genre.toString())
          .where((name) => name.isNotEmpty)
          .toList() ?? <String>[];

      return MovieDbDetail(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? "https://di-sitebuilder-assets.dealerinspire.com/generic-placeholder.png",
        genreIds: parsedGenres,
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] != null && json["release_date"] != ''
            ? DateTime.parse(json["release_date"])
            : DateTime.now(),
        softcore: json["softcore"] ?? false,
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );
    }

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<int>.from(genreIds.map((x) => x)),
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "softcore": softcore,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}