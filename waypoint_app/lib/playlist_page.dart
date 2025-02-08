import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final String playlistTitle;
  final List<Map<String, String>> songs;

  PlaylistPage({required this.playlistTitle, required this.songs});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(playlistTitle),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.search),
          onPressed: () {
            // Implement search functionality here
          },
        ),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return _buildSongItem(songs[index]['title']!, songs[index]['artist']!, songs[index]['imagePath']!);
            },
          ),
        ),
      ),
    );
  }

  // Helper function to build a song item
  Widget _buildSongItem(String title, String artist, String imagePath) {
    return CupertinoListTile(
      title: Text(title),
      subtitle: Text(artist),
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
        // Implement song play functionality here
      },
    );
  }
}
