import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors =Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
       bottom: false,
       left: false,
       child:Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Row(
          children: [
           Icon(Icons.movie_outlined),
           SizedBox(width: 5),
            Text('Peliculas TMDB', style: textStyle,),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}