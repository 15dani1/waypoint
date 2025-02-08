import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'library_page.dart';
import 'navbar.dart';

class RoutePage extends StatefulWidget {
  final String playlistTitle;
  final String playlistImagePath;
  final List<Map<String, String>> songs;

  RoutePage({required this.playlistTitle, required this.playlistImagePath, required this.songs});

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  bool isMapView = false;

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
          }
        },
      ),
      tabBuilder: (BuildContext context , int index){
        return SafeArea(
         child: Container(
          color: Color(0xFFF0FBCE),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  isMapView ? 'https://picsum.photos/id/237/200/300' : widget.playlistImagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CupertinoButton(
              child: Text(isMapView ? 'Show Playlist Image' : 'Show Map View',
                  style: TextStyle(fontSize: 16, color: CupertinoColors.black),
              ),
              onPressed: () {
                setState(() {
                  isMapView = !isMapView;
                });
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.playlistTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'User Name', // Replace with actual user name
                  style: TextStyle(fontSize: 16, color: CupertinoColors.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(CupertinoIcons.heart),
                  onPressed: () {
                    // Implement like functionality here
                  },
                ),
              ),
            ),
            Expanded(
              child: CupertinoScrollbar(
                child: ListView.builder(
                  itemCount: widget.songs.length,
                  itemBuilder: (context, index) {
                    return _buildSongItem(widget.songs[index]['title']!, widget.songs[index]['artist']!, widget.songs[index]['imagePath']!);
                  },
                ),
              ),
            ),
          ],
        ),
         ),
      );
      }
      
    );
  }

  // Helper function to build a song item
  Widget _buildSongItem(String title, String artist, String imagePath) {
    return CupertinoListTile(
      title: Text(title),
      subtitle: Text(artist),
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
        // Implement song play functionality here
      },
    );
  }
}
