import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import 'search_page.dart';
import 'login_page.dart';
import 'home_page.dart';

class LibraryPage extends StatelessWidget {
  final List<Map<String, String>> favoriteRoutes = [
    {'title': 'Favorite Route 1', 'imagePath': 'https://picsum.photos/id/237/200/300'},
    {'title': 'Favorite Route 2', 'imagePath': 'https://picsum.photos/id/237/200/300'},
    {'title': 'Favorite Route 3', 'imagePath': 'https://picsum.photos/id/237/200/300'},
  ];

  final List<Map<String, String>> userRoutes = [
    {'title': 'User Route 1', 'imagePath': 'https://picsum.photos/id/237/200/300'},
    {'title': 'User Route 2', 'imagePath': 'https://picsum.photos/id/237/200/300'},
    {'title': 'User Route 3', 'imagePath': 'https://picsum.photos/id/237/200/300'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
            default:
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => LoginPage()),
              );
          }
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return SafeArea(
          child: Container(
            color: Color(0xFFF0FBCE),
            child: CupertinoScrollbar(
              child: ListView(
                children: [
                  // Title and Profile Picture
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            'https://picsum.photos/id/237/100/100',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text('Your Library', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  // Section 1 - Favorite Routes
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Favorite Routes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  ...favoriteRoutes.map((route) => _buildRouteItem(route['title']!, route['imagePath']!)).toList(),

                  // Section 2 - Your Routes
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Your Routes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  ...userRoutes.map((route) => _buildRouteItem(route['title']!, route['imagePath']!)).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper function to build a route item
  Widget _buildRouteItem(String title, String imagePath) {
    return CupertinoListTile(
      title: Text(title),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        // Navigate to route page or start playing
      },
    );
  }
}

