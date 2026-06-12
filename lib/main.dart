
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/screens/movies/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // Dependencias a instalar:
  // animate_do, card_swiper, dio, flutter_dotenv, flutter_riverpod, go_router, youtube_player_flutter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
