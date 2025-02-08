import 'package:flutter/cupertino.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'library_page.dart';
import 'route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            activeIcon: Icon(CupertinoIcons.home, color: CupertinoColors.black), // Change color to black
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("Let's Explore!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 20),
                        // First Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Recent Waypoints", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: routes.map((route) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: LocationItem(
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
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("Highlights", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9EAA6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text("Attractions", style: TextStyle(fontSize: 16)),
                                ),
                                SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: routes.map((route) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: LocationItem(
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
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9EAA6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text("Restaurants", style: TextStyle(fontSize: 16)),
                                ),
                                SizedBox(height: 10),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: routes.map((route) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: LocationItem(
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
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
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
    return CupertinoButton(
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
           Text(locationName, style: TextStyle(color: Color(0xFF000000), fontSize: 16)),
        ],
      ),
    );
  }
}
