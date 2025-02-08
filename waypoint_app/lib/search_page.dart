import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import 'library_page.dart';
import 'login_page.dart';
import 'home_page.dart';

class SearchPage extends StatelessWidget {
  @override
  // load in recent searches
  // when search, search database for routes (and add to recent searches)
  // also generate routes 
  Widget build(BuildContext context) {
    // return CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.search),
    //         label: 'Search',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.book),
    //         label: 'Library',
    //       ),
    //     ],
    //     onTap: (index) {
    //       switch (index) {
    //         case 0:
    //           Navigator.push(
    //             context,
    //             CupertinoPageRoute(builder: (context) => HomePage()),
    //           );
    //           break;
    //         case 1:
    //           Navigator.push(
    //             context,
    //             CupertinoPageRoute(builder: (context) => SearchPage()),
    //           );
    //           break;
    //         case 2:
    //           Navigator.push(
    //             context,
    //             CupertinoPageRoute(builder: (context) => LibraryPage()),
    //           );
    //           break;
    //         default:
    //           Navigator.push(
    //             context,
    //             CupertinoPageRoute(builder: (context) => LoginPage()),
    //           );
    //       }
    //     },
    //   ),
    //   tabBuilder: (BuildContext context, int index) {
      return CupertinoPageScaffold(
        child: SafeArea(
           child: Container(
          color: Color(0xFFF0FBCE),
          child: CupertinoScrollbar(
            child: ListView(
              children: [
                // Section 1 - Your Playlists
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Your Playlists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                // _buildPlaylistItem('Chill Vibes', 'assets/playlist1.jpg'),
                // _buildPlaylistItem('Top Hits', 'assets/playlist2.jpg'),
                // _buildPlaylistItem('Workout', 'assets/playlist3.jpg'),
                
                // Section 2 - Recently Played
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Recent Searches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                // _buildPlaylistItem('Song 1', 'assets/song1.jpg'),
                // _buildPlaylistItem('Song 2', 'assets/song2.jpg'),
                // _buildPlaylistItem('Song 3', 'assets/song3.jpg'),

                // Section 3 - Routes
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Routes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildRouteItem('Route 1', 'https://picsum.photos/id/237/200/300'),
                _buildRouteItem('Route 2', 'https://picsum.photos/id/237/200/300'),
                _buildRouteItem('Route 3', 'https://picsum.photos/id/237/200/300'),
              ],
            ),
          ),
           ),
        ),
      );
      // },
    // );
  }

  // Helper function to build a playlist item
  Widget _buildPlaylistItem(String name, String imagePath) {
    return CupertinoListTile(
      title: Text(name),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        // Navigate to playlist page or start playing
      },
    );
  }

  // Helper function to build a route item
  Widget _buildRouteItem(String name, String imagePath) {
    return CupertinoListTile(
      title: Text(name),
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
