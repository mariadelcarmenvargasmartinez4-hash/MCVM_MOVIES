import 'package:flutter/material.dart';
import 'package:mcvm_movie/Presentation/views/views.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}