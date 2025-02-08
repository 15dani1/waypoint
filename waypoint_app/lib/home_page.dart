import 'package:flutter/cupertino.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'library_page.dart';
import 'route.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  static const testimg = 'https://picsum.photos/id/237/200/300';
  
  // Sample data for routes
  final List<Map<String, dynamic>> routes = [
    {
      'title': 'Route 1',
      'image': testimg,
      'songs': [
        {'title': 'Song 1', 'artist': 'Artist 1', 'imagePath': testimg},
        {'title': 'Song 2', 'artist': 'Artist 2', 'imagePath': testimg},
        {'title': 'Song 3', 'artist': 'Artist 3', 'imagePath': testimg},
      ],
    },
    {
      'title': 'Route 2',
      'image': testimg,
      'songs': [
        {'title': 'Song 4', 'artist': 'Artist 4', 'imagePath': testimg},
        {'title': 'Song 5', 'artist': 'Artist 5', 'imagePath': testimg},
        {'title': 'Song 6', 'artist': 'Artist 6', 'imagePath': testimg},
      ],
    },
    {
      'title': 'Route 3',
      'image': testimg,
      'songs': [
        {'title': 'Song 7', 'artist': 'Artist 7', 'imagePath': testimg},
        {'title': 'Song 8', 'artist': 'Artist 8', 'imagePath': testimg},
        {'title': 'Song 9', 'artist': 'Artist 9', 'imagePath': testimg},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Library',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoPageScaffold(
              child: SafeArea(
                child: Container(
                  color: Color(0xFFF0FBCE),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Let's Explore!"),
                        SizedBox(height: 40),
                        // First Section
                        Text("Recent Waypoints"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: routes.map((route) {
                              return LocationItem(
                                image: route['image'],
                                locationName: route['title'],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => RoutePage(
                                        playlistTitle: route['title'],
                                        playlistImagePath: route['image'],
                                        songs: route['songs'],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text("Highlights"),
                        Text("Attractions"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: routes.map((route) {
                              return LocationItem(
                                image: route['image'],
                                locationName: route['title'],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => RoutePage(
                                        playlistTitle: route['title'],
                                        playlistImagePath: route['image'],
                                        songs: route['songs'],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 40),
                        Text("Restaurants"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: routes.map((route) {
                              return LocationItem(
                                image: route['image'],
                                locationName: route['title'],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => RoutePage(
                                        playlistTitle: route['title'],
                                        playlistImagePath: route['image'],
                                        songs: route['songs'],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          case 1:
            return SearchPage();
          case 2:
            return LibraryPage();
          default:
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Default'),
              ),
              child: SafeArea(
                child: Center(child: Text('Default Page')),
              ),
            );
        }
      },
    );
  }
}

// A custom widget for location items
class LocationItem extends StatelessWidget {
  final String image;
  final String locationName;
  final VoidCallback onPressed;

  const LocationItem({
    Key? key,
    required this.image,
    required this.locationName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(locationName),
          ],
        ),
      ),
    );
  }
}
