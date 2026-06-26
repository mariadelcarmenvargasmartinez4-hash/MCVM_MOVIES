import 'package:flutter/material.dart';
import 'package:mcvm_movie/domain/entities/movie.dart';

class MovieGenres extends StatelessWidget {
  //final Movie movie;
  final Movie movie;

  const MovieGenres({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsGeometry.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          children: [
  ...movie.genreIds.map((g) => Container(
    margin: EdgeInsets.only(right: 10),
    child: Chip(
      label: Text(g),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ))
]

        )
      )
      
    );
  }
}