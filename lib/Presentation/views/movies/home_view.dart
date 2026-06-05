import 'package:flutter/material.dart';
import 'package:mcvm_movie/Presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                   Text ('data'),
                   Text ('data'),
                    Text ('data'),
                    Text ('data'),
                    Text ('data'),
                ],
              );
            },
            childCount: 100,
          ),
        ),
      ]
    );
  }
}