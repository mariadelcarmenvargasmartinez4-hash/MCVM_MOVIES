import 'package:flutter/material.dart';
import 'package:mcvm_movie/Presentation/screens/movies/home_screen.dart';

void main() {
  runApp(const McvmMovieApp());
}

class McvmMovieApp extends StatelessWidget {
  const McvmMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCVM Movie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}