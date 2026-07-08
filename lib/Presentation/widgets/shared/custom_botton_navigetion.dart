import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;
  const CustomBottomNavigation({super.key, 
  required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(  context).colorScheme;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onItemTapped(context, index),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          activeIcon: Icon(Icons.home_max_outlined),
          label: 'Inicio',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined),
          activeIcon: Icon(Icons.movie_creation),
          label: 'populares',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outlined),
          activeIcon: Icon(Icons.favorite),
          label: 'favoritos',
        ),
      ],
      
    );
  }
}