import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'library_page.dart';
import 'search_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          label: 'Library',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => SearchPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => LibraryPage()),
            );
            break;
        }
      },
    );
  }
}
