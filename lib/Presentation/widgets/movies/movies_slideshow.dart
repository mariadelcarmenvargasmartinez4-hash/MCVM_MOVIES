import 'package:flutter/material.dart';
import 'package:mcvm_movie/domain/domain.dart';
import 'package:card_swiper/card_swiper.dart';

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return Card(
            child: Center(
              child: Text(movie.title),
            ),
          );
        },
      ),
    );
  }
}