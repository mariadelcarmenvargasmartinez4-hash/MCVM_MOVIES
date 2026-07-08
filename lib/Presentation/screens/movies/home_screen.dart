import 'package:flutter/material.dart';
import 'package:mcvm_movie/Presentation/views/movies/home_view.dart';
import 'package:mcvm_movie/Presentation/views/movies/popular_view.dart';
import 'package:mcvm_movie/Presentation/views/movies/favorites_view.dart';
import 'package:mcvm_movie/Presentation/widgets/shared/custom_botton_navigetion.dart';

class HomeScreen extends StatefulWidget {
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
keepPage: true
    );
  }

@override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
final List<Widget> view = const [
    HomeView(),
    PopularView(),
    FavoritesView()
  ];



  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients && pageController.page?.round() != widget.pageIndex) {
      pageController.animateToPage(
        widget.pageIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: view,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex,
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}