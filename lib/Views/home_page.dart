import 'package:escribo_app/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:escribo_app/Views/favorite_view.dart';
import 'package:escribo_app/Views/library_view.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(onPageChanged: _onPageChanged),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          LibraryScreen(),
          FavoriteScreen(),
        ],
      ),
    );
  }
}
