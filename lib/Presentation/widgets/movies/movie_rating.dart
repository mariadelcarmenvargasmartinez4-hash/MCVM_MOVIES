import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget { 
  final double voteAverage;

  const MovieRating({
    super.key,
    required this.voteAverage
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_rounded, color: Colors.amber.shade800),
          const SizedBox(width: 3),
          Text(
            voteAverage.toStringAsFixed(1),
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.amber.shade800,
            ),
          )
        ],
      ),
    );
  }
  }